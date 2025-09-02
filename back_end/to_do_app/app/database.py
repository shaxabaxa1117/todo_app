# app/database.py
from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base

# Данные подключения к PostgreSQL
DB_HOST = "localhost"
DB_PORT = 5432
DB_NAME = "todo_db"
DB_USER = "postgres"
DB_PASS = "password"

DATABASE_URL = f"postgresql://{DB_USER}:{DB_PASS}@{DB_HOST}:{DB_PORT}/{DB_NAME}"

# Создаём движок SQLAlchemy
engine = create_engine(DATABASE_URL, echo=True)

# Фабрика сессий
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)

# Базовый класс для моделей
Base = declarative_base()
