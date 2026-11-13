/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect } from '@ohos/hypium';
import { common, Want } from '@kit.AbilityKit';
import {
  SettingsLiteService,
  SettingsItemModel,
  SettingsOperationStatus,
  ClickResult,
  SystemConfigConstants
} from 'library';
import { TestRes } from '../Utils/TestRes';

class RecordingAbilityContext {
  capturedWant: Want | null = null;
  callCount: number = 0;

  startAbility(want: Want): Promise<void> {
    this.capturedWant = want;
    this.callCount += 1;
    return Promise.resolve();
  }

  asUIAbilityContext(): common.UIAbilityContext {
    return this as Object as common.UIAbilityContext;
  }
}

class StartAbilityTestError extends Error {
  readonly code: number;

  constructor(code: number, message: string) {
    super(message);
    this.code = code;
  }
}

class ThrowingAbilityContext {
  private readonly testError: StartAbilityTestError;

  constructor(testError: StartAbilityTestError) {
    this.testError = testError;
  }

  startAbility(_want: Want): Promise<void> {
    throw this.testError;
  }

  asUIAbilityContext(): common.UIAbilityContext {
    return this as Object as common.UIAbilityContext;
  }
}

function assertIdle(model: SettingsItemModel): void {
  expect(model.operationStatus).assertEqual(SettingsOperationStatus.IDLE);
  expect(model.operationCount).assertEqual(0);
  expect(model.errorMessage).assertEqual('');
}

/**
 * SettingsLiteService core public operation tests.
 */
export default function settingsLiteServiceOperationTest(): void {
  describe('SettingsLiteServiceOperationTest', () => {
    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_OPERATION_0100
     * @tc.name testSettingsLiteServiceOperation0001
     * @tc.desc Verify PIN settings Want and successful service state.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsLiteServiceOperation0001', 0, async () => {
      const service: SettingsLiteService = new SettingsLiteService();
      const context: RecordingAbilityContext = new RecordingAbilityContext();
      service.initialize();
      const opened: boolean = await service.openPinSettingPage(context.asUIAbilityContext());
      const captured: Want | null = context.capturedWant;
      const wantAction: string = captured === null ? '' : (captured.action ?? '');
      const wantUri: string = captured === null ? '' : (captured.uri ?? '');
      expect(opened).assertTrue();
      expect(context.callCount).assertEqual(1);
      expect(wantAction).assertEqual('action.settings.security');
      expect(wantUri).assertEqual('systemui://security/pin');
      expect(service.getPinModel().operationStatus).assertEqual(SettingsOperationStatus.SUCCESS);
      expect(service.getPinModel().operationCount).assertEqual(1);
      expect(service.getPinModel().description).assertEqual(TestRes.str('log_pin_opened'));
      expect(service.getNfcModel().operationStatus).assertEqual(SettingsOperationStatus.IDLE);
      service.destroy();
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_OPERATION_0200
     * @tc.name testSettingsLiteServiceOperation0002
     * @tc.desc Verify NFC settings Want and successful service state.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsLiteServiceOperation0002', 0, async () => {
      const service: SettingsLiteService = new SettingsLiteService();
      const context: RecordingAbilityContext = new RecordingAbilityContext();
      service.initialize();
      const opened: boolean = await service.openNfcSettingsPage(context.asUIAbilityContext());
      const captured: Want | null = context.capturedWant;
      const wantAction: string = captured === null ? '' : (captured.action ?? '');
      const wantUri: string = captured === null ? '' : (captured.uri ?? '');
      expect(opened).assertTrue();
      expect(context.callCount).assertEqual(1);
      expect(wantAction).assertEqual('action.settings.nfc');
      expect(wantUri).assertEqual('systemui://settings/nfc');
      expect(service.getNfcModel().operationStatus).assertEqual(SettingsOperationStatus.SUCCESS);
      expect(service.getNfcModel().operationCount).assertEqual(1);
      expect(service.getNfcModel().description).assertEqual(TestRes.str('log_nfc_opened'));
      expect(service.getPinModel().operationStatus).assertEqual(SettingsOperationStatus.IDLE);
      service.destroy();
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_OPERATION_0300
     * @tc.name testSettingsLiteServiceOperation0003
     * @tc.desc Verify double-click settings Want and successful service state.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsLiteServiceOperation0003', 0, async () => {
      const service: SettingsLiteService = new SettingsLiteService();
      const context: RecordingAbilityContext = new RecordingAbilityContext();
      service.initialize();
      const opened: boolean = await service.openDoubleClickSettingsPage(context.asUIAbilityContext());
      const captured: Want | null = context.capturedWant;
      const wantAction: string = captured === null ? '' : (captured.action ?? '');
      const wantUri: string = captured === null ? '' : (captured.uri ?? '');
      expect(opened).assertTrue();
      expect(context.callCount).assertEqual(1);
      expect(wantAction).assertEqual('action.settings.gesture');
      expect(wantUri).assertEqual('systemui://settings/gesture');
      expect(service.getDoubleClickModel().operationStatus).assertEqual(SettingsOperationStatus.SUCCESS);
      expect(service.getDoubleClickModel().operationCount).assertEqual(1);
      expect(service.getDoubleClickModel().description).assertEqual(TestRes.str('log_double_click_opened'));
      expect(service.getNfcModel().operationStatus).assertEqual(SettingsOperationStatus.IDLE);
      service.destroy();
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_OPERATION_0400
     * @tc.name testSettingsLiteServiceOperation0004
     * @tc.desc Verify PIN synchronous failure details and model isolation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsLiteServiceOperation0004', 0, async () => {
      const service: SettingsLiteService = new SettingsLiteService();
      const context: ThrowingAbilityContext = new ThrowingAbilityContext(
        new StartAbilityTestError(401, 'PIN start failed'));
      service.initialize();
      const opened: boolean = await service.openPinSettingPage(context.asUIAbilityContext());
      const model: SettingsItemModel = service.getPinModel();
      expect(opened).assertFalse();
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.FAILED);
      expect(model.errorCode).assertEqual(401);
      expect(model.errorMessage).assertEqual('PIN start failed');
      expect(model.operationCount).assertEqual(1);
      assertIdle(service.getNfcModel());
      assertIdle(service.getDoubleClickModel());
      service.destroy();
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_OPERATION_0500
     * @tc.name testSettingsLiteServiceOperation0005
     * @tc.desc Verify NFC synchronous failure details and model isolation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsLiteServiceOperation0005', 0, async () => {
      const service: SettingsLiteService = new SettingsLiteService();
      const context: ThrowingAbilityContext = new ThrowingAbilityContext(
        new StartAbilityTestError(402, 'NFC start failed'));
      service.initialize();
      const opened: boolean = await service.openNfcSettingsPage(context.asUIAbilityContext());
      const model: SettingsItemModel = service.getNfcModel();
      expect(opened).assertFalse();
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.FAILED);
      expect(model.errorCode).assertEqual(402);
      expect(model.errorMessage).assertEqual('NFC start failed');
      expect(model.operationCount).assertEqual(1);
      assertIdle(service.getPinModel());
      assertIdle(service.getDoubleClickModel());
      service.destroy();
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_OPERATION_0600
     * @tc.name testSettingsLiteServiceOperation0006
     * @tc.desc Verify double-click synchronous failure details and model isolation.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('testSettingsLiteServiceOperation0006', 0, async () => {
      const service: SettingsLiteService = new SettingsLiteService();
      const context: ThrowingAbilityContext = new ThrowingAbilityContext(
        new StartAbilityTestError(403, 'Gesture start failed'));
      service.initialize();
      const opened: boolean = await service.openDoubleClickSettingsPage(context.asUIAbilityContext());
      const model: SettingsItemModel = service.getDoubleClickModel();
      expect(opened).assertFalse();
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.FAILED);
      expect(model.errorCode).assertEqual(403);
      expect(model.errorMessage).assertEqual('Gesture start failed');
      expect(model.operationCount).assertEqual(1);
      assertIdle(service.getPinModel());
      assertIdle(service.getNfcModel());
      service.destroy();
    });

    /**
     * @tc.number SUB_SETTINGS_LITE_SERVICE_OPERATION_0700
     * @tc.name testSettingsLiteServiceOperation0007
     * @tc.desc Verify double-click query returns FA-only unsupported error in Stage model.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 0
     */
    it('testSettingsLiteServiceOperation0007', 0, () => {
      const service: SettingsLiteService = new SettingsLiteService();
      const context: RecordingAbilityContext = new RecordingAbilityContext();
      let callbackCount: number = 0;
      let callbackError: Object | null = new Error('Callback not invoked');
      let callbackResult: ClickResult = ClickResult.NOT_SELF;
      let callbackErrorCode: number = 0;
      service.initialize();
      service.isDoubleClickAppForSelf(context.asUIAbilityContext(), (err: Object | null, cb): void => {
        callbackCount += 1;
        callbackError = err;
        callbackResult = cb.result;
        callbackErrorCode = cb.errorCode;
      });
      const model: SettingsItemModel = service.getDoubleClickModel();
      // settingsLite is an FA-model-only interface; under the Stage model it faithfully reports an unsupported error instead of a simulated success
      expect(callbackCount).assertEqual(1);
      expect(callbackError !== null).assertTrue();
      expect(callbackResult).assertEqual(ClickResult.ERROR);
      expect(callbackErrorCode).assertEqual(SystemConfigConstants.ERROR_INTERNAL);
      expect(model.operationStatus).assertEqual(SettingsOperationStatus.FAILED);
      expect(model.clickResult).assertEqual(ClickResult.ERROR);
      expect(model.operationCount).assertEqual(1);
      service.destroy();
    });
  });
}
