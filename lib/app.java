import io.agora.media.RtcTokenBuilder2;
import io.agora.media.RtcTokenBuilder2.Role;

public class app {
      static String appId = "2046e027c066439abb1778e4ac9b9dce";
      static String appCertificate = "cbd553187c3248d0a9fc803a62629eea";
      static String channelName = "11110000";
      static int uid = 0;
      static int expirationTimeInSeconds = 3600;

      public static void main(String[] args) throws Exception {
            RtcTokenBuilder2 tokenBuilder = new RtcTokenBuilder2();
            int timestamp = (int) (System.currentTimeMillis() / 1000 + expirationTimeInSeconds);

            System.out.println("UID token");
            String result = tokenBuilder.buildTokenWithUid(appId, appCertificate,
                        channelName, uid, Role.ROLE_PUBLISHER, timestamp, timestamp);
            System.out.println(result);
      }
}