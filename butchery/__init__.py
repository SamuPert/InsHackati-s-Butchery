from flask import Flask
import os


def create_app(test_config=None):
    # create and configure the app
    app = Flask(__name__, instance_relative_config=True)
    app.config.from_mapping(
        SECRET_KEY='dev',
        DATABASE_PATH=os.path.join(app.instance_path, 'InsHack@ti.sqlite'),
        UPLOADS_FOLDER='uploads/',
        LOCKED_REGISTRATION=True,
    )

    if test_config is None:
        # load the instance config, if it exists, when not testing
        app.config.from_pyfile('config.py', silent=True)
    else:
        # load the test config if passed in
        app.config.from_mapping(test_config)

    # ensure the instance folder exists
    try:
        os.makedirs(app.instance_path)
    except OSError:
        pass

    # import DB
    from . import database
    database.init_app(app)

    # import base
    from . import base
    app.register_blueprint(base.bp)

    # import auth
    from . import auth
    app.register_blueprint(auth.bp)

    # import challenges
    from . import challenges
    app.register_blueprint(challenges.bp)

    # import exploits
    from . import exploits
    app.register_blueprint(exploits.bp)

    # import flags
    from . import flags
    app.register_blueprint(flags.bp)

    # import patches
    from . import patches
    app.register_blueprint(patches.bp)

    # import teams
    from . import teams
    app.register_blueprint(teams.bp)

    return app
