# app/main.py
from fastapi import FastAPI, Depends
from sqlalchemy.orm import Session
from . import models, schemas, crud
from .database import engine, SessionLocal, Base

# Создаём таблицы
Base.metadata.create_all(bind=engine)

app = FastAPI()

# Зависимость для подключения к БД
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()


@app.get("/todos", response_model=list[schemas.ToDoRead],)
def read_todos(db: Session = Depends(get_db)):
    return crud.get_todos(db)


@app.post("/todos")
def create_todo(todo: schemas.ToDoCreate, db: Session = Depends(get_db)):
    return crud.create_todo(db, todo)

@app.delete("/todos/{todo_id}")
def delete_todos(todo_id:int, db : Session = Depends(get_db)):
    return crud.delete_todo(db = db,todo_id = todo_id )\

@app.patch("/todos/{todo_id}")
def update_todos(todo_id : int, todo: schemas.ToDoUpdate,db : Session = Depends(get_db)):
    return crud.update_todo(db,todo_id,todo)

