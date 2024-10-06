### **Overview**

Pinokio is a comprehensive note-taking and diary app that leverages the power of AI to assist users in creating personalized schedules based on their daily entries. By integrating the Ollama framework with the Llama3.1 model, Pinokio is able to analyze user-generated text and extract key information to generate tailored task checklists and schedules.

**UI Design**: here is the figma link for a basic look into what pinokio's UI is supposed to look like-
https://www.figma.com/design/OjaIdONcKzwVwO17RG1Y3r/Pinokio?node-id=0-1&t=5EJdxVKClAB7uPfs-1


### **Key Features**

* **Note-Taking and Diary:** Pinokio provides a user-friendly interface for capturing notes and diary entries.
* **AI-Powered Scheduling:** The app utilizes the Llama3.1 model to analyze user-generated text and generate relevant task checklists and schedules.
* **Customizable Schedules:** Users can customize their schedules to fit their preferences and priorities.
* **Checklist Generation:** Pinokio automatically creates checklists based on the content of user notes and diary entries.

### **Technical Stack**

* **Flutter:** The app's UI is built using Flutter for cross-platform compatibility.
* **Python:** Python is used for backend operations and integration with the Ollama framework.
* **Ollama:** Ollama provides the infrastructure for running the Llama3.1 model and processing user input.
* **Llama3.1:** The Llama3.1 model is specifically tuned for generating schedules and is integrated into the app.
* **HTTP Requests:** HTTP requests are used for communication between the Flutter frontend and the Python backend.

### **Usage**

1. **Create Notes or Diary Entries:** Write down your daily thoughts, activities, or goals in the app.
2. **Generate Schedule:** Pinokio will analyze your entries and suggest a tailored schedule based on the content.
3. **Customize Schedule:** Modify the generated schedule to fit your preferences and priorities.
4. **Track Progress:** Use the built-in checklist feature to track your progress on tasks.

### **Deployment**

1. Install [Ollama](https://ollama.com/download) for your respective operating system
2. execute "pip install -r requirements.txt"
3. execute "ollama pull llama3.1:8b"
4. execute "ollama create pinokio -f ./myllamaa3.1.modelfile"
5. run "python3 test.py" to start the server for the application to perform REST actions
6. Run the flutter app on desired platform.

### **Future Enhancements**

* **Natural Language Processing:** Improve the app's ability to understand and interpret user-generated text.
* **Integration with Calendar Apps:** Allow users to sync generated schedules with popular calendar apps.
* **Priority Setting:** Incorporate a feature for users to prioritize tasks within their schedules.
* **Goal Tracking:** Implement a system for tracking long-term goals and progress towards achieving them.

### **Contributing**

We welcome contributions from the community! If you're interested in contributing, please follow these guidelines:

1. **Fork the repository.**
2. **Create a new branch.**
3. **Make your changes.**
4. **Submit a pull request.**

**Note:** Please ensure that your code adheres to our coding standards and passes all tests.
