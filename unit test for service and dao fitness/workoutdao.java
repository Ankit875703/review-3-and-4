public class WorkoutSession {
    private int sessionId;
    private String workoutType;
    private int duration; // in minutes
    private int caloriesBurned;

    // Constructor, getters, and setters

    public WorkoutSession(int sessionId, String workoutType, int duration, int caloriesBurned) {
        this.sessionId = sessionId;
        this.workoutType = workoutType;
        this.duration = duration;
        this.caloriesBurned = caloriesBurned;
    }

    public int getSessionId() {
        return sessionId;
    }

    public void setSessionId(int sessionId) {
        this.sessionId = sessionId;
    }

    public String getWorkoutType() {
        return workoutType;
    }

    public void setWorkoutType(String workoutType) {
        this.workoutType = workoutType;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public int getCaloriesBurned() {
        return caloriesBurned;
    }

    public void setCaloriesBurned(int caloriesBurned) {
        this.caloriesBurned = caloriesBurned;
    }
}
