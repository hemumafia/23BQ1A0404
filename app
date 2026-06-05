from flask import Flask, request, jsonify
import uuid
from datetime import datetime
app = Flask(__name__)

def log(masg):
    print(f"[LOG] {msg}")

notification = []

@app.route("/notifications",methods=["GET"])
def get_notificcations():
    student_id=request.args.get("student_id")
    notif_type=request.args.get("type")
    is_read=request.args.get("is_read")

    result = notifications[:]
    if student_id:
        result=[n for n in result if n["student_id"]==student_id]
    if notif_type:
        result=[n for n in result if n["type"]==notif_type]
    if is_read is not None:
        result=[n for n in result if n["is_read"]==(is_read=="true")]

    result.sort(key=lambda n: n["created_at"])
        