public class FitnessDAO {

    private Map<Integer, Member> memberDB = new HashMap<>();

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
}
