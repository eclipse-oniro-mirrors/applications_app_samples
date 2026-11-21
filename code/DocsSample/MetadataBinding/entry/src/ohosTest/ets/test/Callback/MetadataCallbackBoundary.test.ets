import {
  describe,
  it,
  expect,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  TestType,
  Size,
  Level
} from '@ohos/hypium';
import MetadataBindingController from '../../../../main/ets/model/MetadataBindingController';
import { RecordingMetadataPort } from '../Shared/SharedDriver';

export default function metadataCallbackBoundaryTest(): void {
  describe('metadataCallbackBoundaryTest', (): void => {
    beforeAll((): void => {});
    beforeEach(async (): Promise<void> => {
      const yieldDelayMs: number = 30;
      await new Promise<void>((resolve): void => {
        setTimeout((): void => {
          resolve();
        }, yieldDelayMs);
      });
    });
    afterEach((): void => {});
    afterAll((): void => {});
    /**
     * @tc.number SUB_METADATA_BINDING_CALLBACK_0100
     * @tc.name callbackBoundary001
     * @tc.desc Verify screenShotCallback(-1) does not call the metadata service
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('callbackBoundary001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const controller = new MetadataBindingController(port);
      const event: number = -1;
      controller.screenShotCallback(event);
      const actual: string[] = port.describeCalls();
      const expected: string[] = [];
      expect(actual).assertDeepEquals(expected);
    });

    /**
     * @tc.number SUB_METADATA_BINDING_CALLBACK_0200
     * @tc.name callbackBoundary002
     * @tc.desc Verify screenShotCallback(0) does not call the metadata service
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('callbackBoundary002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const controller = new MetadataBindingController(port);
      const event: number = 0;
      controller.screenShotCallback(event);
      const actual: string[] = port.describeCalls();
      const expected: string[] = [];
      expect(actual).assertDeepEquals(expected);
    });

    /**
     * @tc.number SUB_METADATA_BINDING_CALLBACK_0300
     * @tc.name callbackBoundary003
     * @tc.desc Verify screenShotCallback(1) submits test.link exactly once
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('callbackBoundary003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const controller = new MetadataBindingController(port);
      const event: number = 1;
      controller.screenShotCallback(event);
      const actual: string[] = port.describeCalls();
      const expected: string[] = ['submit|test.link'];
      expect(actual).assertDeepEquals(expected);
    });

    /**
     * @tc.number SUB_METADATA_BINDING_CALLBACK_0400
     * @tc.name callbackBoundary004
     * @tc.desc Verify screenShotCallback(2) does not call the metadata service
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('callbackBoundary004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const controller = new MetadataBindingController(port);
      const event: number = 2;
      controller.screenShotCallback(event);
      const actual: string[] = port.describeCalls();
      const expected: string[] = [];
      expect(actual).assertDeepEquals(expected);
    });

    /**
     * @tc.number SUB_METADATA_BINDING_CALLBACK_0500
     * @tc.name callbackBoundary005
     * @tc.desc Verify screenShotCallback(0.9999999999999999) does not call the metadata service
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('callbackBoundary005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const controller = new MetadataBindingController(port);
      const event: number = 0.9999999999999999;
      controller.screenShotCallback(event);
      const actual: string[] = port.describeCalls();
      const expected: string[] = [];
      expect(actual).assertDeepEquals(expected);
    });

    /**
     * @tc.number SUB_METADATA_BINDING_CALLBACK_0600
     * @tc.name callbackBoundary006
     * @tc.desc Verify screenShotCallback(1.0000000000000002) does not call the metadata service
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('callbackBoundary006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const controller = new MetadataBindingController(port);
      const event: number = 1.0000000000000002;
      controller.screenShotCallback(event);
      const actual: string[] = port.describeCalls();
      const expected: string[] = [];
      expect(actual).assertDeepEquals(expected);
    });

    /**
     * @tc.number SUB_METADATA_BINDING_CALLBACK_0700
     * @tc.name callbackBoundary007
     * @tc.desc Verify screenShotCallback(NaN) does not call the metadata service
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('callbackBoundary007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const controller = new MetadataBindingController(port);
      const event: number = NaN;
      controller.screenShotCallback(event);
      const actual: string[] = port.describeCalls();
      const expected: string[] = [];
      expect(actual).assertDeepEquals(expected);
    });

    /**
     * @tc.number SUB_METADATA_BINDING_CALLBACK_0800
     * @tc.name callbackBoundary008
     * @tc.desc Verify screenShotCallback(Infinity) does not call the metadata service
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('callbackBoundary008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const controller = new MetadataBindingController(port);
      const event: number = Infinity;
      controller.screenShotCallback(event);
      const actual: string[] = port.describeCalls();
      const expected: string[] = [];
      expect(actual).assertDeepEquals(expected);
    });

    /**
     * @tc.number SUB_METADATA_BINDING_CALLBACK_0900
     * @tc.name callbackBoundary009
     * @tc.desc Verify screenShotCallback(-Infinity) does not call the metadata service
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('callbackBoundary009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const controller = new MetadataBindingController(port);
      const event: number = -Infinity;
      controller.screenShotCallback(event);
      const actual: string[] = port.describeCalls();
      const expected: string[] = [];
      expect(actual).assertDeepEquals(expected);
    });

    /**
     * @tc.number SUB_METADATA_BINDING_CALLBACK_1000
     * @tc.name callbackBoundary010
     * @tc.desc Verify screenShotCallback(-0) does not call the metadata service
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('callbackBoundary010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const controller = new MetadataBindingController(port);
      const event: number = -0;
      controller.screenShotCallback(event);
      const actual: string[] = port.describeCalls();
      const expected: string[] = [];
      expect(actual).assertDeepEquals(expected);
    });

    /**
     * @tc.number SUB_METADATA_BINDING_CALLBACK_1100
     * @tc.name callbackBoundary011
     * @tc.desc Verify screenShotCallback(Number.MAX_SAFE_INTEGER) does not call the metadata service
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('callbackBoundary011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const port = new RecordingMetadataPort();
      const controller = new MetadataBindingController(port);
      const event: number = Number.MAX_SAFE_INTEGER;
      controller.screenShotCallback(event);
      const actual: string[] = port.describeCalls();
      const expected: string[] = [];
      expect(actual).assertDeepEquals(expected);
    });

  });
}
