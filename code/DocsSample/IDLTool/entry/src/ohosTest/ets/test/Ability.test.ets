import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import IdlTestImp from '../../../main/ets/IIdlTestServiceTs/IdlTestImp';
import IdlTestServiceProxy from '../../../main/ets/IIdlTestServiceTs/idl_test_service_proxy';
import MySequenceable from '../../../main/ets/MySequenceable';
import { rpc } from '@kit.IPCKit';

const TAG = 'IdlGuidelinesTest';
const DOMAIN = 0x0000;

export default function abilityTest() {
  describe('IdlGuidelinesTest', () => {
    let testImp: IdlTestImp | null = null;
    let testProxy: IdlTestServiceProxy | null = null;

    beforeAll(() => {
      hilog.info(DOMAIN, TAG, 'beforeAll: init test service and proxy');
      testImp = new IdlTestImp('IdlTestService');
      testProxy = new IdlTestServiceProxy(testImp as rpc.IRemoteObject);
    })

    beforeEach(() => {
    })

    afterEach(() => {
    })

    afterAll(() => {
      testImp = null;
      testProxy = null;
    })

    // [Start idl_test_int_transaction]
    it('testIntTransaction_shouldReturnDataPlusOne', 0, async () => {
      hilog.info(DOMAIN, TAG, 'testIntTransaction start');
      return new Promise<void>((resolve, reject) => {
        if (testProxy == null) {
          reject(new Error('testProxy is null'));
          return;
        }
        testProxy.testIntTransaction(123, (errCode: number, ret: number) => {
          hilog.info(DOMAIN, TAG, 'testIntTransaction errCode: ' + errCode + ', ret: ' + ret);
          expect(errCode).assertEqual(0);
          expect(ret).assertEqual(124);
          resolve();
        });
      });
    })
    // [End idl_test_int_transaction]

    // [Start idl_test_string_transaction]
    it('testStringTransaction_shouldReturnSuccess', 0, async () => {
      hilog.info(DOMAIN, TAG, 'testStringTransaction start');
      return new Promise<void>((resolve, reject) => {
        if (testProxy == null) {
          reject(new Error('testProxy is null'));
          return;
        }
        testProxy.testStringTransaction('hello idl', (errCode: number) => {
          hilog.info(DOMAIN, TAG, 'testStringTransaction errCode: ' + errCode);
          expect(errCode).assertEqual(0);
          resolve();
        });
      });
    })
    // [End idl_test_string_transaction]

    // [Start idl_test_service_implementation]
    it('IdlTestImp_testIntTransaction', 0, () => {
      hilog.info(DOMAIN, TAG, 'IdlTestImp testIntTransaction start');
      if (testImp == null) {
        expect(false).assertTrue();
        return;
      }
      testImp.testIntTransaction(100, (errCode: number, ret: number) => {
        expect(errCode).assertEqual(0);
        expect(ret).assertEqual(101);
      });
    })

    it('IdlTestImp_testStringTransaction', 0, () => {
      hilog.info(DOMAIN, TAG, 'IdlTestImp testStringTransaction start');
      if (testImp == null) {
        expect(false).assertTrue();
        return;
      }
      testImp.testStringTransaction('test', (errCode: number) => {
        expect(errCode).assertEqual(0);
      });
    })
    // [End idl_test_service_implementation]

    // [Start idl_test_sequenceable]
    it('MySequenceable_marshalling_unmarshalling', 0, () => {
      hilog.info(DOMAIN, TAG, 'MySequenceable marshalling/unmarshalling start');
      let origin = new MySequenceable(42, 'hello');
      let parcel = new rpc.MessageSequence();
      let result = origin.marshalling(parcel);
      expect(result).assertTrue();

      let target = new MySequenceable(0, '');
      let unmarshallResult = target.unmarshalling(parcel);
      expect(unmarshallResult).assertTrue();
      expect(target.getNum()).assertEqual(42);
      expect(target.getString()).assertEqual('hello');
    })
    // [End idl_test_sequenceable]
  })
}
