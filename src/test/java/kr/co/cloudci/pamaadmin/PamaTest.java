package kr.co.cloudci.pamaadmin;



import kr.co.cloudci.pama.minier.service.DevicesItem;
import kr.co.cloudci.pama.minier.service.MainerService;
import kr.co.cloudci.pama.minier.service.GmainerVO;
import org.junit.jupiter.api.Test;

public class PamaTest {

    public String formatValue(int value, int defaultPrecision, String valueUnit) {
        if (value >= 1000000000)
            return ((value / 1000000000) + " G" + valueUnit);
        else if (value >= 1000000)
            return ((value / 1000000) + " M" + valueUnit);
        else if (value >= 1000)
            return ((value / 1000) + " K" + valueUnit);
        else
            return (value + " " + valueUnit);
    }

    @Test
    public void test1() {

        MainerService mainerService = new MainerService();

        for (int i=1;i < 10;i++){
            GmainerVO result = mainerService.getStat("http://220.126.107.155:3333"+i+"/stat");
            for(DevicesItem  devicesItem : result.getDevices() ) {


                System.out.println(" Hash : " + devicesItem.getName()+ " " +  devicesItem.getTemperature() + " " + formatValue(devicesItem.getSpeed(), result.getSpeedRatePrecision(), result.getSpeedUnit()) );
            };

        }



           //System.out.println(result.toString());

//            try {
//
//                Thread.sleep(1000); //1초 대기
//
//            } catch (InterruptedException e) {
//
//                e.printStackTrace();
//
//            }



    }
}
