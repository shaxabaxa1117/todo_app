from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.future import select
import models
import schemas


async def get_tasks(db: AsyncSession):
    result = await db.execute(select(models.Task))
    return result.scalars().all()

async def create_task(db: AsyncSession, task: schemas.TaskCreate):
    new_task = models.Task(**task.dict())
    db.add(new_task)
    await db.commit()
    await db.refresh(new_task)
    return new_task
