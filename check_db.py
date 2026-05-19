import sqlite3
import os

db_path = os.path.join('DataBase', 'travelmate.db')
if not os.path.exists(db_path):
    print(f"Error: DB not found at {db_path}")
else:
    conn = sqlite3.connect(db_path)
    cursor = conn.cursor()
    cursor.execute('SELECT id, status FROM bookings')
    rows = cursor.fetchall()
    print(f"Total bookings in DB: {len(rows)}")
    for row in rows:
        print(f"ID: {row[0]}, Status: {row[1]}")
    conn.close()
