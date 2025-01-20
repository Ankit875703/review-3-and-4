public class FitnessDAO {
    private Map<Integer, Member> memberDB = new HashMap<>();
    private Map<Integer, WorkoutSession> sessionDB = new HashMap<>();

    public boolean saveMember(Member member) {
        if (member == null || memberDB.containsKey(member.getId())) {
            return false;
        }
        memberDB.put(member.getId(), member);
        return true;
    }

    public Member getMemberById(int memberId) {
        return memberDB.get(memberId);
    }

    public boolean updateMember(Member member) {
        if (!memberDB.containsKey(member.getId())) {
            return false;
        }
        memberDB.put(member.getId(), member);
        return true;
    }

    public boolean saveWorkoutSession(WorkoutSession session) {
        if (session == null || sessionDB.containsKey(session.getSessionId())) {
            return false;
        }
        sessionDB.put(session.getSessionId(), session);
        return true;
    }

    public WorkoutSession getWorkoutSessionById(int sessionId) {
        return sessionDB.get(sessionId);
    }
}
