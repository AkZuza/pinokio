from fastapi import FastAPI, Query
import ollama
from fastapi.middleware.cors import CORSMiddleware
import json

app = FastAPI()

origins = ["*"]

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

@app.get("/greet")
def greet(query: str = Query(default="I want to eat breakfast, lunch and dinner, give me optimal timings", description="Name to greet")):
    query = json.loads(query)["message"]
    
    stream = ollama.chat(
        model='pinokio',
        messages=[{'role': 'user', 'content': query}],
        stream=False,
    ) 
    stream = stream['message']['content']
    
    return {"message": stream}



if __name__ == "__main__":
    import uvicorn
    uvicorn.run(app, host="127.0.0.1", port=8000)


