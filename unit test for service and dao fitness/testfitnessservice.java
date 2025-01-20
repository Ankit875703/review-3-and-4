import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import static org.mockito.Mockito.*;
import static org.junit.jupiter.api.Assertions.*;

public class FitnessServiceTest {

    private FitnessDAO fitnessDAO;
    private FitnessService fitnessService;

    @BeforeEach
    void setUp() {
        fitnessDAO = mock(FitnessDAO.class);
        fitnessService = new FitnessService(fitnessDAO);
    }

    @Test
    void testRegisterMember_Success() {
        Member member = new Member(1, "John Doe");
        when(fitnessDAO.saveMember(member)).thenReturn(true);

        boolean result = fitnessService.registerMember(member);

        assertTrue(result);
        verify(fitnessDAO, times(1)).saveMember(member);
    }

    @Test
    void testRegisterMember_InvalidDetails() {
        Member member = new Member(1, "");

        IllegalArgumentException exception = assertThrows(IllegalArgumentException.class, () -> {
            fitnessService.registerMember(member);
        });

        assertEquals("Invalid member details", exception.getMessage());
    }

    @Test
    void testGetMemberDetails_Success() {
        Member member = new Member(1, "John Doe");
        when(fitnessDAO.getMemberById(1)).thenReturn(member);

        Member result = fitnessService.getMemberDetails(1);

        assertNotNull(result);
        assertEquals("John Doe", result.getName());
    }

    @Test
    void testUpdateMemberPlan_Success() {
        Member member = new Member(1, "John Doe");
        FitnessPlan plan = new FitnessPlan("Advanced");
        when(fitnessDAO.getMemberById(1)).thenReturn(member);
        when(fitnessDAO.updateMember(member)).thenReturn(true);

        boolean result = fitnessService.updateMemberPlan(1, plan);

        assertTrue(result);
        assertEquals(plan, member.getFitnessPlan());
        verify(fitnessDAO, times(1)).updateMember(member);
    }

    @Test
    void testUpdateMemberPlan_MemberNotFound() {
        FitnessPlan plan = new FitnessPlan("Advanced");
        when(fitnessDAO.getMemberById(1)).thenReturn(null);

        IllegalArgumentException exception = assertThrows(IllegalArgumentException.class, () -> {
            fitnessService.updateMemberPlan(1, plan);
        });

        assertEquals("Member not found", exception.getMessage());
    }
}
