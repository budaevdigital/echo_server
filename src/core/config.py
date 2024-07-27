import os

from pydantic import Field
from pydantic_settings import BaseSettings, SettingsConfigDict

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
ENV_PATH = os.path.join(BASE_DIR, ".env")


class SettingsMixins:
    model_config = SettingsConfigDict(extra="ignore", env_file=ENV_PATH, env_file_encoding="utf-8")


class ProjectSettings(BaseSettings, SettingsMixins):
    base_dir: str = BASE_DIR
    log_level: int = Field(default=10)
    log_format: str = Field(default="%(asctime)s [%(levelname).1s]: [in %(filename)s: line %(lineno)d] - %(message)s")


class Settings:
    app = ProjectSettings()


settings = Settings()
