from fastapi import FastAPI
from pymongo import MongoClient
import os

app = FastAPI()
PASS = "admin"

mongo_uri = os.getenv(
    "MONGO_URL", f"mongodb+srv://admin:{PASS}@cluster0.eekni1o.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0")
print("MongoDB Verbindungs-URL:", mongo_uri)
client = MongoClient(mongo_uri)

db = client.get_database("redilab")
collection = db.get_collection("users")
