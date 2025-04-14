import pandas as pd

def analyze_csv(file_path, threshold):
    try:
        df = pd.read_csv(file_path)
        df['average'] = df['grade']
        qualified_students = df[df['average'] > threshold]
        
        print(f"\nStudents with average grade above {threshold}:\n")
        for name in qualified_students['name']:
            print(name)
    except Exception as e:
        print(f"Error reading CSV: {e}")


analyze_csv("./students.csv", 75)
