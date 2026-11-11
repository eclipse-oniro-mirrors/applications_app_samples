import { describe, it, expect } from '@ohos/hypium';
import { Driver } from '@kit.TestKit';
import { BusinessError } from '@kit.BasicServicesKit';

export default function driverProbeTest() {
  describe('driverProbeTest', () => {
    it('probe', 0, async () => {
      try {
        const d: Driver = Driver.create();
        expect(d !== null).assertTrue();
      } catch (e) {
        const err = e as BusinessError;
        expect(`code=${err.code} msg=${err.message}`).assertEqual('');
      }
    });
  });
}
