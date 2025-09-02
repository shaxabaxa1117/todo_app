from fastapi import FastAPI, Depends
from sqlalchemy.ext.asyncio import AsyncSession
from database import SessionLocal, engine, Base
import crud
import schemas

app = FastAPI()

# Создаем таблицы (для теста, потом будет alembic)
@app.on_event("startup")
async def startup():
    async with engine.begin() as conn:
        await conn.run_sync(Base.metadata.create_all)

async def get_db():
    async with SessionLocal() as session:
        yield session

@app.get("/tasks", response_model=list[schemas.TaskResponse])
async def read_tasks(db: AsyncSession = Depends(get_db)):
    return await crud.get_tasks(db)

@app.post("/tasks", response_model=schemas.TaskResponse)
async def create_task(task: schemas.TaskCreate, db: AsyncSession = Depends(get_db)):
    return await crud.create_task(db, task)


# source .venv/bin/activate
