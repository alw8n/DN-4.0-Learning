package org.example;

import org.junit.Test;
import static org.mockito.Mockito.*;

public class MyServiceTest {

    @Test
    public void testVerifyInteraction() {
        // 1. Create mock
        ExternalApi mockApi = mock(ExternalApi.class);

        // (Optional) stub to avoid null return
        when(mockApi.getData(anyString())).thenReturn("Some Data");

        // 2. Use in service
        MyService service = new MyService(mockApi);
        service.fetchData();

        // 3. Verify the interaction with specific argument
        verify(mockApi).getData("my_param");
    }
}