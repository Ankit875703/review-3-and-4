import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;

public class FitnessDAOTest {

    private FitnessDAO fitnessDAO;

    @BeforeEach
    void setUp() {
        fitnessDAO = new FitnessDAO();
    }

    @Test
    void testSaveMember_Success() {
        Member member = new Member(1, "John Doe");

        boolean result = fitnessDAO.saveMember(member);

        assertTrue(result);
    }

    @Test
    void testSaveMember_Failure_DuplicateId() {
        Member member = new Member(1, "John Doe");
        fitnessDAO.saveMember(member);

        Member duplicateMember = new Member(1, "Jane Doe");

        boolean result = fitnessDAO.saveMember(duplicateMember);

        assertFalse(result);
    }

    @Test
    void testGetMemberById_Success() {
        Member member = new Member(1, "John Doe");
        fitnessDAO.saveMember(member);

        Member result = fitnessDAO.getMemberById(1);

        assertNotNull(result);
        assertEquals("John Doe", result.getName());
    }

    @Test
    void testGetMemberById_NotFound() {
        Member result = fitnessDAO.getMemberById(999);
        assertNull(result);
    }

    @Test
    void testUpdateMember_Success() {
        Member member = new Member(1, "John Doe");
        fitnessDAO.saveMember(member);

        member.setName("John Doe Updated");

        boolean result = fitnessDAO.updateMember(member);

        assertTrue(result);
        Member updatedMember = fitnessDAO.getMemberById(1);
        assertEquals("John Doe Updated", updatedMember.getName());
    }

    @Test
    void testUpdateMember_NotFound() {
        Member member = new Member(1, "John Doe");
        boolean result = fitnessDAO.updateMember(member);

        assertFalse(result);
    }
}
