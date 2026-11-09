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

import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { AppConstants } from 'common';
import {
  IrBrandEntry,
  IrCapability,
  IrCapabilityProbe,
  IrCode,
  IrCompileError,
  IrCompileResult,
  IrFrame,
  IrLibraryCode,
  IrLibraryIndex,
  IrProtocol,
  SendFrame,
  SendJob,
  SendProgress,
  SendSource,
  SendState,
  SendStep,
  SendTicket,
  TransmitErrorMapper,
  TransmitResult,
  TransmitResultCode
} from 'ircore';

/**
 * ircore data model suite: enum, default value and error mapper checks without system calls.
*/


/** Hilog domain reserved for the IR model logic tests. */
const DOMAIN: number = 0xF83F;
/** Prefix added to every case log so the logs can be filtered by suite. */
const SUITE_PREFIX: string = 'MeetingScene_IrModel_';
/** Default carrier frequency in hertz declared inside IrTypes. */
const DEFAULT_FREQUENCY_HZ: number = 38000;
/** Default delay in milliseconds between two steps of a send job. */
const DEFAULT_STEP_DELAY_MS: number = 250;
/** Default repeat count of a library entry. */
const DEFAULT_REPEAT_COUNT: number = 1;
/** Member counts of the five enums declared in IrTypes. */
const PROTOCOL_COUNT: number = 5;
const COMPILE_ERROR_COUNT: number = 5;
const TRANSMIT_CODE_COUNT: number = 6;
const SEND_STATE_COUNT: number = 4;
const SEND_SOURCE_COUNT: number = 2;
/** Field counts of the plain data classes, used to detect silent field additions. */
const IR_CODE_FIELD_COUNT: number = 11;
const IR_FRAME_FIELD_COUNT: number = 3;
const IR_COMPILE_RESULT_FIELD_COUNT: number = 4;
const IR_CAPABILITY_FIELD_COUNT: number = 6;
const TRANSMIT_RESULT_FIELD_COUNT: number = 3;
const SEND_PROGRESS_FIELD_COUNT: number = 8;
const SEND_FRAME_FIELD_COUNT: number = 2;
const SEND_STEP_FIELD_COUNT: number = 5;
const SEND_JOB_FIELD_COUNT: number = 4;
const SEND_TICKET_FIELD_COUNT: number = 3;
const BRAND_ENTRY_FIELD_COUNT: number = 7;
const LIBRARY_INDEX_FIELD_COUNT: number = 2;
const LIBRARY_CODE_FIELD_COUNT: number = 4;
/** BusinessError codes exercised by the mapper cases. */
const ERR_PERMISSION_DENIED: number = 201;
const ERR_INVALID_PARAM: number = 401;
const ERR_NOT_FOUND: number = 404;
const ERR_OVERFLOW: number = 90001;

interface BusinessErrorLike {
  name: string;
  message: string;
  code: number;
}

/** Builds a BusinessError shaped literal for the error mapper inputs. */
function buildBizError(code: number, message: string): BusinessErrorLike {
  const error: BusinessErrorLike = {
    name: 'IrModelTestError',
    message: message,
    code: code
  };
  return error;
}

/** Counts the own enumerable keys of a plain data object. */
function countKeys(target: Object): number {
  return Object.keys(target).length;
}

/** Reports whether two string arrays carry the same values in the same order. */
function sameStringArray(first: string[], second: string[]): boolean {
  if (first.length !== second.length) {
    return false;
  }
  for (let i: number = 0; i < first.length; i++) {
    if (first[i] !== second[i]) {
      return false;
    }
  }
  return true;
}

/** Builds the expected IrProtocol member list. */
function expectedProtocols(): string[] {
  return [IrProtocol.NEC, IrProtocol.RC5, IrProtocol.RC6, IrProtocol.SONY, IrProtocol.RAW];
}

/** Builds the expected IrCompileError member list. */
function expectedCompileErrors(): string[] {
  return [
    IrCompileError.NONE,
    IrCompileError.EMPTY_PAYLOAD,
    IrCompileError.INVALID_VALUE,
    IrCompileError.UNSUPPORTED_PROTOCOL,
    IrCompileError.TOO_LONG
  ];
}

/** Builds the expected TransmitResultCode member list. */
function expectedTransmitCodes(): string[] {
  return [
    TransmitResultCode.OK,
    TransmitResultCode.PERM_DENIED,
    TransmitResultCode.PARAM_ERROR,
    TransmitResultCode.NO_EMITTER,
    TransmitResultCode.BUSY,
    TransmitResultCode.UNKNOWN
  ];
}

/** Builds the expected SendState member list. */
function expectedSendStates(): string[] {
  return [SendState.PENDING, SendState.SENDING, SendState.SUCCESS, SendState.FAILED];
}

/** Builds the expected SendSource member list. */
function expectedSendSources(): string[] {
  return [SendSource.MANUAL, SendSource.SCENE];
}

/** Reports whether every string in the list occurs exactly once. */
function allDistinct(values: string[]): boolean {
  for (let i: number = 0; i < values.length; i++) {
    for (let j: number = i + 1; j < values.length; j++) {
      if (values[i] === values[j]) {
        return false;
      }
    }
  }
  return true;
}

/** Builds the full IrProtocol member list in declaration order. */
function allProtocols(): IrProtocol[] {
  const protocols: IrProtocol[] = [IrProtocol.NEC, IrProtocol.RC5, IrProtocol.RC6,
    IrProtocol.SONY, IrProtocol.RAW];
  return protocols;
}

/** Builds the full SendState member list in declaration order. */
function allSendStates(): SendState[] {
  const states: SendState[] = [SendState.PENDING, SendState.SENDING, SendState.SUCCESS,
    SendState.FAILED];
  return states;
}

export default function irModelLogicTest() {
  describe('IrModelLogicTest', () => {


    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0100
     * @tc.name      testIrModel0001
     * @tc.desc      Verify the SendState enum exposes exactly four distinct lifecycle values in the
     *               documented pending to failed order.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrModel0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testIrModel0001';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(SendState.PENDING).assertEqual('PENDING');
      expect(SendState.SENDING).assertEqual('SENDING');
      expect(SendState.SUCCESS).assertEqual('SUCCESS');
      expect(SendState.FAILED).assertEqual('FAILED');
      const states: SendState[] = allSendStates();
      const texts: string[] = [];
      for (let i: number = 0; i < states.length; i++) {
        texts.push(states[i].toString());
      }
      expect(states.length).assertEqual(SEND_STATE_COUNT);
      expect(allDistinct(texts)).assertTrue();
      expect(states[SEND_STATE_COUNT - 1]).assertEqual(SendState.FAILED);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0101
     * @tc.name      testIrModel0002
     * @tc.desc      Verify the SendSource enum has exactly the manual and scene origins with distinct
     *               string literals.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrModel0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrModel0002';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(SendSource.MANUAL).assertEqual('MANUAL');
      expect(SendSource.SCENE).assertEqual('SCENE');
      const manualSource: string = SendSource.MANUAL;
      const sceneSource: string = SendSource.SCENE;
      expect(manualSource !== sceneSource).assertTrue();
      expect(SendSource.MANUAL.length).assertEqual(6);
      expect(SendSource.SCENE.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0102
     * @tc.name      testIrModel0003
     * @tc.desc      Verify a new IrCode carries the documented defaults: RAW protocol, 38 kHz carrier,
     *               repeat count one and empty text metadata.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrModel0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testIrModel0003';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const code: IrCode = new IrCode();
      expect(code.protocol).assertEqual(IrProtocol.RAW);
      expect(code.frequencyHz).assertEqual(DEFAULT_FREQUENCY_HZ);
      expect(code.repeatCount).assertEqual(DEFAULT_REPEAT_COUNT);
      expect(code.id).assertEqual('');
      expect(code.payload).assertEqual('');
      expect(code.source).assertEqual('');
      expect(code.license).assertEqual('');
      expect(code.brand).assertEqual('');
      expect(code.model).assertEqual('');
      expect(code.keySemantic).assertEqual('');
      expect(code.checksum).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0103
     * @tc.name      testIrModel0004
     * @tc.desc      Verify the model default carrier frequency matches AppConstants and the documented
     *               38000 hertz value used by the whole sample.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrModel0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrModel0004';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const code: IrCode = new IrCode();
      const frame: SendFrame = new SendFrame();
      expect(code.frequencyHz).assertEqual(AppConstants.DEFAULT_FREQUENCY_HZ);
      expect(frame.frequencyHz).assertEqual(AppConstants.DEFAULT_FREQUENCY_HZ);
      expect(AppConstants.DEFAULT_FREQUENCY_HZ).assertEqual(38000);
      expect(code.frequencyHz > 0).assertTrue();
      expect(frame.frequencyHz > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0104
     * @tc.name      testIrModel0005
     * @tc.desc      Verify the default step delay matches AppConstants.STEP_INTERVAL_MS and equals the
     *               documented 250 milliseconds pacing.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrModel0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrModel0005';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const step: SendStep = new SendStep();
      expect(step.delayMs).assertEqual(DEFAULT_STEP_DELAY_MS);
      expect(step.delayMs).assertEqual(AppConstants.STEP_INTERVAL_MS);
      expect(AppConstants.STEP_INTERVAL_MS).assertEqual(250);
      expect(step.delayMs >= AppConstants.MIN_STEP_INTERVAL_MS).assertTrue();
      expect(step.delayMs <= AppConstants.MAX_STEP_INTERVAL_MS).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0105
     * @tc.name      testIrModel0006
     * @tc.desc      Verify a new IrFrame starts with index zero, an empty pattern and a zero duration,
     *               which makes it unusable until the compiler fills it.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrModel0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrModel0006';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const frame: IrFrame = new IrFrame();
      expect(frame.index).assertEqual(0);
      expect(frame.pattern.length).assertEqual(0);
      expect(frame.durationUs).assertEqual(0);
      expect(frame.pattern instanceof Array).assertTrue();
      expect(frame.durationUs >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0106
     * @tc.name      testIrModel0007
     * @tc.desc      Verify a new IrCompileResult represents failure without an error: ok false, error
     *               NONE, no frames and an empty message.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrModel0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrModel0007';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const result: IrCompileResult = new IrCompileResult();
      expect(result.ok).assertFalse();
      expect(result.error).assertEqual(IrCompileError.NONE);
      expect(result.frames.length).assertEqual(0);
      expect(result.message).assertEqual('');
      expect(result.frames instanceof Array).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0107
     * @tc.name      testIrModel0008
     * @tc.desc      Verify a new IrCapability is the safe read-only default with no emitter, zero
     *               frequency bounds and an unsupported default carrier.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrModel0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testIrModel0008';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const capability: IrCapability = new IrCapability();
      expect(capability.hasEmitter).assertFalse();
      expect(capability.minFrequencyHz).assertEqual(0);
      expect(capability.maxFrequencyHz).assertEqual(0);
      expect(capability.supportsDefaultFrequency).assertFalse();
      expect(capability.readOnly).assertTrue();
      expect(capability.reason).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0108
     * @tc.name      testIrModel0009
     * @tc.desc      Verify a new TransmitResult reports the UNKNOWN result code with zero duration and
     *               an empty message.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrModel0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrModel0009';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const result: TransmitResult = new TransmitResult();
      expect(result.code).assertEqual(TransmitResultCode.UNKNOWN);
      expect(result.durationMs).assertEqual(0);
      expect(result.message).assertEqual('');
      expect(result.code !== TransmitResultCode.OK).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0109
     * @tc.name      testIrModel0010
     * @tc.desc      Verify a new SendProgress starts with empty identifiers, zero counters, the
     *               PENDING state and the UNKNOWN result code.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrModel0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testIrModel0010';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const progress: SendProgress = new SendProgress();
      expect(progress.ticketId).assertEqual('');
      expect(progress.sceneRunId).assertEqual('');
      expect(progress.stepIndex).assertEqual(0);
      expect(progress.totalSteps).assertEqual(0);
      expect(progress.deviceId).assertEqual('');
      expect(progress.keyId).assertEqual('');
      expect(progress.state).assertEqual(SendState.PENDING);
      expect(progress.resultCode).assertEqual(TransmitResultCode.UNKNOWN);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0110
     * @tc.name      testIrModel0011
     * @tc.desc      Verify a new SendFrame carries the default carrier frequency and an empty pattern,
     *               so the queue falls back to the default carrier when it is left untouched.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrModel0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrModel0011';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const frame: SendFrame = new SendFrame();
      expect(frame.frequencyHz).assertEqual(DEFAULT_FREQUENCY_HZ);
      expect(frame.pattern.length).assertEqual(0);
      expect(frame.pattern instanceof Array).assertTrue();
      expect(frame.frequencyHz !== 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0111
     * @tc.name      testIrModel0012
     * @tc.desc      Verify a new SendStep starts at index zero with empty identifiers, no frames and the
     *               default delay.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrModel0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrModel0012';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const step: SendStep = new SendStep();
      expect(step.index).assertEqual(0);
      expect(step.deviceId).assertEqual('');
      expect(step.keyId).assertEqual('');
      expect(step.frames.length).assertEqual(0);
      expect(step.delayMs).assertEqual(DEFAULT_STEP_DELAY_MS);
      expect(step.frames instanceof Array).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0112
     * @tc.name      testIrModel0013
     * @tc.desc      Verify a new SendJob defaults to the MANUAL source with an empty ticket, an empty
     *               scene run id and no steps.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrModel0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testIrModel0013';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const job: SendJob = new SendJob();
      expect(job.source).assertEqual(SendSource.MANUAL);
      expect(job.ticketId).assertEqual('');
      expect(job.sceneRunId).assertEqual('');
      expect(job.steps.length).assertEqual(0);
      expect(job.source !== SendSource.SCENE).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0113
     * @tc.name      testIrModel0014
     * @tc.desc      Verify a new SendTicket is a non accepted ticket with an empty id and an empty
     *               rejection reason.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrModel0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrModel0014';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const ticket: SendTicket = new SendTicket();
      expect(ticket.accepted).assertFalse();
      expect(ticket.ticketId).assertEqual('');
      expect(ticket.reason).assertEqual('');
      expect(ticket.accepted).assertFalse();
      expect(ticket.ticketId.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0114
     * @tc.name      testIrModel0015
     * @tc.desc      Verify a new IrBrandEntry has empty text fields plus empty device type and model
     *               arrays.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIrModel0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testIrModel0015';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const brand: IrBrandEntry = new IrBrandEntry();
      expect(brand.brandId).assertEqual('');
      expect(brand.brandName).assertEqual('');
      expect(brand.deviceTypes.length).assertEqual(0);
      expect(brand.models.length).assertEqual(0);
      expect(brand.source).assertEqual('');
      expect(brand.license).assertEqual('');
      expect(brand.file).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0115
     * @tc.name      testIrModel0016
     * @tc.desc      Verify a new IrLibraryIndex has an empty version and no brands, and a new
     *               IrLibraryCode holds empty metadata with a default IrCode.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIrModel0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testIrModel0016';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const index: IrLibraryIndex = new IrLibraryIndex();
      expect(index.version).assertEqual('');
      expect(index.brands.length).assertEqual(0);
      const code: IrLibraryCode = new IrLibraryCode();
      expect(code.brandId).assertEqual('');
      expect(code.model).assertEqual('');
      expect(code.deviceType).assertEqual('');
      expect(code.code.protocol).assertEqual(IrProtocol.RAW);
      expect(code.code.frequencyHz).assertEqual(DEFAULT_FREQUENCY_HZ);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0116
     * @tc.name      testIrModel0017
     * @tc.desc      Verify two independently created model instances never share their mutable array
     *               fields, which protects callers that build several codes at once.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrModel0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrModel0017';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const first: IrCompileResult = new IrCompileResult();
      const second: IrCompileResult = new IrCompileResult();
      const firstFrame: IrFrame = new IrFrame();
      firstFrame.pattern = [100, 200];
      first.frames.push(firstFrame);
      expect(first.frames.length).assertEqual(1);
      expect(second.frames.length).assertEqual(0);
      const firstJob: SendJob = new SendJob();
      const secondJob: SendJob = new SendJob();
      firstJob.steps.push(new SendStep());
      expect(firstJob.steps.length).assertEqual(1);
      expect(secondJob.steps.length).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0117
     * @tc.name      testIrModel0018
     * @tc.desc      Verify two IrFrame instances created without explicit patterns do not share the
     *               same array instance, so appending to one never mutates the other.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIrModel0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testIrModel0018';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const first: IrFrame = new IrFrame();
      const second: IrFrame = new IrFrame();
      first.pattern.push(9000);
      first.pattern.push(4500);
      expect(first.pattern.length).assertEqual(2);
      expect(second.pattern.length).assertEqual(0);
      expect(first.pattern === second.pattern).assertFalse();
      expect(first.durationUs).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0118
     * @tc.name      testIrModel0019
     * @tc.desc      Verify assigning a protocol to an IrCode only changes that instance, leaving a
     *               second code on the RAW default.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrModel0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrModel0019';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const necCode: IrCode = new IrCode();
      necCode.protocol = IrProtocol.NEC;
      necCode.repeatCount = 3;
      const untouched: IrCode = new IrCode();
      expect(necCode.protocol).assertEqual(IrProtocol.NEC);
      expect(necCode.repeatCount).assertEqual(3);
      expect(untouched.protocol).assertEqual(IrProtocol.RAW);
      expect(untouched.repeatCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0119
     * @tc.name      testIrModel0020
     * @tc.desc      Verify every protocol value can be stored in and read back from an IrCode field
     *               without coercion, keeping the exact enum identity.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrModel0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrModel0020';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const protocols: IrProtocol[] = allProtocols();
      for (let i: number = 0; i < protocols.length; i++) {
        const code: IrCode = new IrCode();
        code.protocol = protocols[i];
        expect(code.protocol).assertEqual(protocols[i]);
        expect(code.protocol.toString()).assertEqual(protocols[i].toString());
      }
      expect(protocols.length).assertEqual(5);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0120
     * @tc.name      testIrModel0021
     * @tc.desc      Verify a fully populated SendStep keeps its assigned index, identifiers, frame list
     *               and delay, and that the frame list keeps insertion order.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrModel0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrModel0021';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const step: SendStep = new SendStep();
      step.index = 2;
      step.deviceId = 'dev-1';
      step.keyId = 'key-1';
      step.delayMs = 100;
      const firstFrame: SendFrame = new SendFrame();
      firstFrame.pattern = [9000, 4500];
      const secondFrame: SendFrame = new SendFrame();
      secondFrame.frequencyHz = 40000;
      secondFrame.pattern = [560, 1690];
      step.frames.push(firstFrame);
      step.frames.push(secondFrame);
      expect(step.index).assertEqual(2);
      expect(step.deviceId).assertEqual('dev-1');
      expect(step.keyId).assertEqual('key-1');
      expect(step.delayMs).assertEqual(100);
      expect(step.frames.length).assertEqual(2);
      expect(step.frames[0].pattern[0]).assertEqual(9000);
      expect(step.frames[1].frequencyHz).assertEqual(40000);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0121
     * @tc.name      testIrModel0022
     * @tc.desc      Verify a populated SendProgress keeps the ticket, scene run id, step counters and
     *               the device and key identifiers exactly as assigned.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrModel0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrModel0022';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const progress: SendProgress = new SendProgress();
      progress.ticketId = 'job-1-1';
      progress.sceneRunId = 'run-1';
      progress.stepIndex = 1;
      progress.totalSteps = 3;
      progress.deviceId = 'dev-1';
      progress.keyId = 'key-1';
      progress.state = SendState.SENDING;
      progress.resultCode = TransmitResultCode.OK;
      expect(progress.ticketId).assertEqual('job-1-1');
      expect(progress.sceneRunId).assertEqual('run-1');
      expect(progress.stepIndex).assertEqual(1);
      expect(progress.totalSteps).assertEqual(3);
      expect(progress.state).assertEqual(SendState.SENDING);
      expect(progress.resultCode).assertEqual(TransmitResultCode.OK);
      expect(progress.stepIndex < progress.totalSteps).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0122
     * @tc.name      testIrModel0023
     * @tc.desc      Verify the SendState values support the lifecycle comparisons used by the queue:
     *               only SUCCESS counts as a successful step and FAILED differs from it.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrModel0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrModel0023';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const finished: SendState = SendState.SUCCESS;
      expect(finished === SendState.SUCCESS).assertTrue();
      const pendingState: string = SendState.PENDING;
      const sendingState: string = SendState.SENDING;
      const successState: string = SendState.SUCCESS;
      const failedState: string = SendState.FAILED;
      expect(successState === failedState).assertFalse();
      expect(pendingState === successState).assertFalse();
      expect(sendingState === pendingState).assertFalse();
      expect(failedState !== successState).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0123
     * @tc.name      testIrModel0024
     * @tc.desc      Verify the TransmitResultCode values are distinct so a failure can never be
     *               mistaken for the OK code used by the queue success path.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrModel0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrModel0024';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const okCode: string = TransmitResultCode.OK;
      const busyCode: string = TransmitResultCode.BUSY;
      const unknownCode: string = TransmitResultCode.UNKNOWN;
      const permDeniedCode: string = TransmitResultCode.PERM_DENIED;
      const paramErrorCode: string = TransmitResultCode.PARAM_ERROR;
      const noEmitterCode: string = TransmitResultCode.NO_EMITTER;
      expect(okCode !== busyCode).assertTrue();
      expect(okCode !== unknownCode).assertTrue();
      expect(permDeniedCode !== paramErrorCode).assertTrue();
      expect(noEmitterCode !== busyCode).assertTrue();
      expect(unknownCode !== noEmitterCode).assertTrue();
      const codes: string[] = expectedTransmitCodes();
      let okCount: number = 0;
      for (let i: number = 0; i < codes.length; i++) {
        if (codes[i] === TransmitResultCode.OK) {
          okCount++;
        }
      }
      expect(okCount).assertEqual(1);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0124
     * @tc.name      testIrModel0025
     * @tc.desc      Verify the IrCompileError success code NONE never equals any concrete failure
     *               code, so callers can test error === NONE as a success guard.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 0
     */
    it('testIrModel0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const TAG: string = 'testIrModel0025';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const failures: IrCompileError[] = [
        IrCompileError.EMPTY_PAYLOAD, IrCompileError.INVALID_VALUE,
        IrCompileError.UNSUPPORTED_PROTOCOL, IrCompileError.TOO_LONG
      ];
      for (let i: number = 0; i < failures.length; i++) {
        expect(failures[i] !== IrCompileError.NONE).assertTrue();
        expect(failures[i].toString().length > 0).assertTrue();
      }
      expect(failures.length).assertEqual(COMPILE_ERROR_COUNT - 1);
      expect(IrCompileError.NONE === IrCompileError.NONE).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0125
     * @tc.name      testIrModel0026
     * @tc.desc      Verify a manually built successful compile result keeps the frames and the NONE
     *               error code, and that clearing frames does not reset the ok flag.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIrModel0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testIrModel0026';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const result: IrCompileResult = new IrCompileResult();
      const frame: IrFrame = new IrFrame();
      frame.pattern = [100, 200];
      frame.durationUs = 300;
      result.ok = true;
      result.frames.push(frame);
      result.error = IrCompileError.NONE;
      expect(result.ok).assertTrue();
      expect(result.frames.length).assertEqual(1);
      expect(result.frames[0].durationUs).assertEqual(300);
      result.frames = [];
      expect(result.frames.length).assertEqual(0);
      expect(result.ok).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0126
     * @tc.name      testIrModel0027
     * @tc.desc      Verify an accepted ticket keeps the ticket id while a rejected ticket keeps the
     *               rejection reason, matching the two queue outcomes.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrModel0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrModel0027';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const accepted: SendTicket = new SendTicket();
      accepted.accepted = true;
      accepted.ticketId = 'job-1-1';
      const rejected: SendTicket = new SendTicket();
      rejected.accepted = false;
      rejected.reason = 'BUSY';
      expect(accepted.accepted).assertTrue();
      expect(accepted.ticketId.startsWith('job-')).assertTrue();
      expect(rejected.accepted).assertFalse();
      expect(rejected.reason).assertEqual('BUSY');
      expect(rejected.ticketId).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0127
     * @tc.name      testIrModel0028
     * @tc.desc      Verify a populated capability with an emitter reports a usable frequency window and
     *               a supported default carrier while readOnly turns false.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrModel0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrModel0028';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const capability: IrCapability = new IrCapability();
      capability.hasEmitter = true;
      capability.minFrequencyHz = 30000;
      capability.maxFrequencyHz = 60000;
      capability.supportsDefaultFrequency = true;
      capability.readOnly = false;
      capability.reason = '';
      expect(capability.hasEmitter).assertTrue();
      expect(capability.readOnly).assertFalse();
      expect(capability.minFrequencyHz < capability.maxFrequencyHz).assertTrue();
      expect(capability.minFrequencyHz <= DEFAULT_FREQUENCY_HZ).assertTrue();
      expect(DEFAULT_FREQUENCY_HZ <= capability.maxFrequencyHz).assertTrue();
      expect(capability.reason).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0128
     * @tc.name      testIrModel0029
     * @tc.desc      Verify a populated SendJob keeps the assigned scene source, run id and ordered step
     *               list, and that later steps stay in insertion order.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrModel0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrModel0029';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const job: SendJob = new SendJob();
      job.source = SendSource.SCENE;
      job.sceneRunId = 'run-42';
      for (let i: number = 0; i < 3; i++) {
        const step: SendStep = new SendStep();
        step.index = i;
        step.deviceId = 'dev-' + i.toString();
        job.steps.push(step);
      }
      expect(job.source).assertEqual(SendSource.SCENE);
      expect(job.sceneRunId).assertEqual('run-42');
      expect(job.steps.length).assertEqual(3);
      expect(job.steps[0].index).assertEqual(0);
      expect(job.steps[2].index).assertEqual(2);
      expect(job.steps[2].deviceId).assertEqual('dev-2');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0129
     * @tc.name      testIrModel0030
     * @tc.desc      Verify a populated IrCode keeps every metadata field including the optional
     *               checksum and the semantic name used for library matching.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrModel0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrModel0030';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const code: IrCode = new IrCode();
      code.id = 'lib-1';
      code.protocol = IrProtocol.NEC;
      code.frequencyHz = 38000;
      code.payload = '0x08,0xF7';
      code.repeatCount = 2;
      code.source = 'Sample library';
      code.license = 'Apache-2.0';
      code.brand = 'Demo';
      code.model = 'KJ-100';
      code.keySemantic = 'POWER_ON';
      code.checksum = 'a1b2c3d4';
      expect(code.id).assertEqual('lib-1');
      expect(code.protocol).assertEqual(IrProtocol.NEC);
      expect(code.payload).assertEqual('0x08,0xF7');
      expect(code.repeatCount).assertEqual(2);
      expect(code.brand).assertEqual('Demo');
      expect(code.keySemantic).assertEqual('POWER_ON');
      expect(code.checksum.length).assertEqual(8);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0130
     * @tc.name      testIrModel0031
     * @tc.desc      Verify a frame pattern accepts an odd number of values on the model level, since
     *               padding is the compiler responsibility and the model stores it verbatim.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIrModel0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testIrModel0031';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const frame: IrFrame = new IrFrame();
      frame.pattern = [100, 200, 300];
      frame.durationUs = 600;
      expect(frame.pattern.length).assertEqual(3);
      expect(frame.pattern.length % 2).assertEqual(1);
      expect(frame.durationUs).assertEqual(600);
      frame.pattern.push(300);
      expect(frame.pattern.length).assertEqual(4);
      expect(frame.pattern.length % 2).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0131
     * @tc.name      testIrModel0032
     * @tc.desc      Verify the maximum pattern length constant and the model frame keep consistent
     *               bounds, so a pattern of exactly the limit is representable.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIrModel0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testIrModel0032';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const frame: IrFrame = new IrFrame();
      frame.pattern = [];
      for (let i: number = 0; i < AppConstants.MAX_PATTERN_LENGTH; i++) {
        frame.pattern.push(100 + (i % 5));
      }
      expect(frame.pattern.length).assertEqual(AppConstants.MAX_PATTERN_LENGTH);
      expect(frame.pattern.length).assertEqual(1024);
      expect(frame.pattern[0]).assertEqual(100);
      expect(frame.pattern[frame.pattern.length - 1]).assertEqual(103);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0132
     * @tc.name      testIrModel0033
     * @tc.desc      Verify the transmit result duration counts milliseconds from zero and keeps a
     *               non negative value after assignment.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrModel0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrModel0033';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const result: TransmitResult = new TransmitResult();
      result.code = TransmitResultCode.OK;
      result.durationMs = 37;
      result.message = 'Transmitted';
      expect(result.code).assertEqual(TransmitResultCode.OK);
      expect(result.durationMs).assertEqual(37);
      expect(result.durationMs >= 0).assertTrue();
      expect(result.message).assertEqual('Transmitted');
      expect(result.message.length > 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0133
     * @tc.name      testIrModel0034
     * @tc.desc      Verify the library index supports several brand entries and that each brand keeps
     *               its own device type and model lists without cross contamination.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIrModel0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testIrModel0034';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const index: IrLibraryIndex = new IrLibraryIndex();
      index.version = '1';
      const first: IrBrandEntry = new IrBrandEntry();
      first.brandId = 'brand-a';
      first.deviceTypes.push('tv');
      first.models.push('A-1');
      const second: IrBrandEntry = new IrBrandEntry();
      second.brandId = 'brand-b';
      second.deviceTypes.push('stb');
      index.brands.push(first);
      index.brands.push(second);
      expect(index.version).assertEqual('1');
      expect(index.brands.length).assertEqual(2);
      expect(index.brands[0].models.length).assertEqual(1);
      expect(index.brands[1].models.length).assertEqual(0);
      expect(index.brands[0].deviceTypes[0]).assertEqual('tv');
      expect(index.brands[1].deviceTypes[0]).assertEqual('stb');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0134
     * @tc.name      testIrModel0035
     * @tc.desc      Verify the frame interval constant stays below the step interval constant, matching
     *               the queue pacing assumption between frames and between steps.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIrModel0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testIrModel0035';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(AppConstants.FRAME_INTERVAL_MS < AppConstants.STEP_INTERVAL_MS).assertTrue();
      expect(AppConstants.FRAME_INTERVAL_MS > 0).assertTrue();
      expect(AppConstants.MIN_STEP_INTERVAL_MS).assertEqual(0);
      expect(AppConstants.STEP_INTERVAL_MS <= AppConstants.MAX_STEP_INTERVAL_MS).assertTrue();
      expect(AppConstants.MAX_STEP_INTERVAL_MS).assertEqual(5000);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0135
     * @tc.name      testIrModel0036
     * @tc.desc      Verify the IrLibraryCode wrapper keeps the brand metadata together with the parsed
     *               code, and that two wrappers never share the wrapped code instance.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIrModel0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testIrModel0036';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const first: IrLibraryCode = new IrLibraryCode();
      first.brandId = 'demo';
      first.model = 'KJ-100';
      first.deviceType = 'tv';
      first.code.protocol = IrProtocol.SONY;
      const second: IrLibraryCode = new IrLibraryCode();
      expect(first.brandId).assertEqual('demo');
      expect(first.code.protocol).assertEqual(IrProtocol.SONY);
      expect(second.code.protocol).assertEqual(IrProtocol.RAW);
      expect(first.code === second.code).assertFalse();
      expect(second.brandId).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0136
     * @tc.name      testIrModel0037
     * @tc.desc      Verify a brand entry can carry multiple device types and models and that the list
     *               length reflects every appended value.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIrModel0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testIrModel0037';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const brand: IrBrandEntry = new IrBrandEntry();
      brand.brandId = 'demo';
      brand.brandName = 'Demo Brand';
      brand.source = 'Sample library';
      brand.license = 'Apache-2.0';
      brand.file = 'demo.json';
      brand.deviceTypes.push('tv');
      brand.deviceTypes.push('stb');
      brand.models.push('KJ-100');
      brand.models.push('KJ-200');
      brand.models.push('KJ-300');
      expect(brand.deviceTypes.length).assertEqual(2);
      expect(brand.models.length).assertEqual(3);
      expect(brand.file).assertEqual('demo.json');
      expect(brand.license).assertEqual('Apache-2.0');
      expect(brand.models[2]).assertEqual('KJ-300');
      expect(brand.deviceTypes.indexOf('tv') >= 0).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0137
     * @tc.name      testIrModel0038
     * @tc.desc      Verify a job with several steps keeps every step delay independent, so changing one
     *               step delay never modifies the neighbouring step.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIrModel0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testIrModel0038';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const job: SendJob = new SendJob();
      for (let i: number = 0; i < 3; i++) {
        job.steps.push(new SendStep());
      }
      job.steps[0].delayMs = 0;
      job.steps[1].delayMs = 500;
      expect(job.steps[0].delayMs).assertEqual(0);
      expect(job.steps[1].delayMs).assertEqual(500);
      expect(job.steps[2].delayMs).assertEqual(DEFAULT_STEP_DELAY_MS);
      expect(job.steps[0].delayMs === job.steps[1].delayMs).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0138
     * @tc.name      testIrModel0039
     * @tc.desc      Verify the compile result and the transmit result never alias each other, as they
     *               model different stages of one send and must keep separate error channels.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIrModel0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testIrModel0039';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const compiled: IrCompileResult = new IrCompileResult();
      const transmitted: TransmitResult = new TransmitResult();
      compiled.error = IrCompileError.INVALID_VALUE;
      transmitted.code = TransmitResultCode.PARAM_ERROR;
      expect(compiled.error).assertEqual(IrCompileError.INVALID_VALUE);
      expect(transmitted.code).assertEqual(TransmitResultCode.PARAM_ERROR);
      expect(compiled.error.toString()).assertEqual('INVALID_VALUE');
      expect(transmitted.code.toString()).assertEqual('PARAM_ERROR');
      expect(compiled.ok).assertFalse();
      expect(transmitted.durationMs).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0139
     * @tc.name      testIrModel0040
     * @tc.desc      Verify the frame and step count fields default to zero for a brand new code and frame,
     *               so a caller can distinguish an empty model from a filled one without null checks.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIrModel0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testIrModel0040';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const compiled: IrCompileResult = new IrCompileResult();
      const job: SendJob = new SendJob();
      const ticket: SendTicket = new SendTicket();
      expect(compiled.frames.length).assertEqual(0);
      expect(job.steps.length).assertEqual(0);
      expect(ticket.accepted).assertFalse();
      expect(ticket.ticketId).assertEqual('');
      expect(ticket.reason).assertEqual('');
      expect(countKeys(compiled)).assertEqual(IR_COMPILE_RESULT_FIELD_COUNT);
      expect(countKeys(ticket)).assertEqual(SEND_TICKET_FIELD_COUNT);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0140
     * @tc.name      testIrModel0041
     * @tc.desc      Verify the five member lists built from the enum helpers keep their documented
     *               order and lengths, which pins the enum declaration order used by the UI.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrModel0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrModel0041';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const protocols: string[] = expectedProtocols();
      const compileErrors: string[] = expectedCompileErrors();
      const transmitCodes: string[] = expectedTransmitCodes();
      const states: string[] = expectedSendStates();
      const sources: string[] = expectedSendSources();
      expect(protocols.length).assertEqual(PROTOCOL_COUNT);
      expect(compileErrors.length).assertEqual(COMPILE_ERROR_COUNT);
      expect(transmitCodes.length).assertEqual(TRANSMIT_CODE_COUNT);
      expect(states.length).assertEqual(SEND_STATE_COUNT);
      expect(sources.length).assertEqual(SEND_SOURCE_COUNT);
      expect(sameStringArray(protocols, [IrProtocol.NEC, IrProtocol.RC5, IrProtocol.RC6,
        IrProtocol.SONY, IrProtocol.RAW])).assertTrue();
      expect(sameStringArray(sources, [SendSource.MANUAL, SendSource.SCENE])).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0141
     * @tc.name      testIrModel0042
     * @tc.desc      Verify the capability cache accessor returns the object that was installed by the
     *               test helper, and that a second install replaces the first one completely.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIrModel0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testIrModel0042';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const first: IrCapability = new IrCapability();
      first.hasEmitter = false;
      first.readOnly = true;
      first.reason = 'IrModelLogic first install';
      IrCapabilityProbe.setCachedForTest(first);
      expect(IrCapabilityProbe.getCached().reason).assertEqual('IrModelLogic first install');
      expect(IrCapabilityProbe.getCached().hasEmitter).assertFalse();
      const second: IrCapability = new IrCapability();
      second.hasEmitter = false;
      second.readOnly = true;
      second.reason = 'IrModelLogic second install';
      second.minFrequencyHz = 30000;
      IrCapabilityProbe.setCachedForTest(second);
      expect(IrCapabilityProbe.getCached().reason).assertEqual('IrModelLogic second install');
      expect(IrCapabilityProbe.getCached().minFrequencyHz).assertEqual(30000);
      expect(countKeys(IrCapabilityProbe.getCached())).assertEqual(IR_CAPABILITY_FIELD_COUNT);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0142
     * @tc.name      testIrModel0043
     * @tc.desc      Verify the mapper resolves the permission error code and the invalid parameter code,
     *               and that the same code always yields the same mapped value.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrModel0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrModel0043';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const denied: TransmitResultCode =
        TransmitErrorMapper.fromError(buildBizError(ERR_PERMISSION_DENIED, 'permission denied'));
      const invalid: TransmitResultCode =
        TransmitErrorMapper.fromError(buildBizError(ERR_INVALID_PARAM, 'invalid parameter'));
      expect(denied).assertEqual(TransmitResultCode.PERM_DENIED);
      expect(invalid).assertEqual(TransmitResultCode.PARAM_ERROR);
      expect(denied !== invalid).assertTrue();
      expect(TransmitErrorMapper.fromError(buildBizError(ERR_PERMISSION_DENIED, 'again')))
        .assertEqual(TransmitResultCode.PERM_DENIED);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0143
     * @tc.name      testIrModel0044
     * @tc.desc      Verify unmapped error codes such as zero, negative, not found and an oversized code
     *               all collapse into the UNKNOWN result code.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrModel0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrModel0044';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const codes: number[] = [0, -1, ERR_NOT_FOUND, ERR_OVERFLOW];
      for (let i: number = 0; i < codes.length; i++) {
        const mapped: TransmitResultCode =
          TransmitErrorMapper.fromError(buildBizError(codes[i], 'unmapped code'));
        expect(mapped).assertEqual(TransmitResultCode.UNKNOWN);
        expect(mapped !== TransmitResultCode.OK).assertTrue();
        expect(mapped !== TransmitResultCode.PERM_DENIED).assertTrue();
      }
      expect(codes.length).assertEqual(4);
      expect(TransmitErrorMapper.fromError(buildBizError(ERR_NOT_FOUND, 'gone')))
        .assertEqual(TransmitResultCode.UNKNOWN);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0144
     * @tc.name      testIrModel0045
     * @tc.desc      Verify the error mapper never mutates the input error object, so the caller keeps
     *               the original name, message and code after the mapping call.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIrModel0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testIrModel0045';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const error: BusinessErrorLike = buildBizError(ERR_INVALID_PARAM, 'bad argument');
      const mapped: TransmitResultCode = TransmitErrorMapper.fromError(error);
      expect(mapped).assertEqual(TransmitResultCode.PARAM_ERROR);
      expect(error.code).assertEqual(ERR_INVALID_PARAM);
      expect(error.name).assertEqual('IrModelTestError');
      expect(error.message).assertEqual('bad argument');
      expect(countKeys(error)).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0145
     * @tc.name      testIrModel0046
     * @tc.desc      Verify a fully populated IrCode keeps all eleven fields and that its declared carrier
     *               and repeat count survive being read back in the same order they were assigned.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 1
     */
    it('testIrModel0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const TAG: string = 'testIrModel0046';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const code: IrCode = new IrCode();
      code.id = 'demo-KJ-100-power';
      code.protocol = IrProtocol.NEC;
      code.frequencyHz = DEFAULT_FREQUENCY_HZ;
      code.payload = '0x08,0xF7';
      code.repeatCount = DEFAULT_REPEAT_COUNT;
      code.source = 'Sample library';
      code.license = 'Apache-2.0';
      code.brand = 'Demo';
      code.model = 'KJ-100';
      code.keySemantic = 'POWER_ON';
      code.checksum = 'a1b2c3d4';
      expect(countKeys(code)).assertEqual(IR_CODE_FIELD_COUNT);
      expect(code.protocol).assertEqual(IrProtocol.NEC);
      expect(code.frequencyHz).assertEqual(DEFAULT_FREQUENCY_HZ);
      expect(code.repeatCount).assertEqual(DEFAULT_REPEAT_COUNT);
      expect(code.keySemantic).assertEqual('POWER_ON');
      expect(code.checksum).assertEqual('a1b2c3d4');
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0146
     * @tc.name      testIrModel0047
     * @tc.desc      Verify the model field counts of the frame, step and job classes equal the declared
     *               structural constants, so an accidental field addition fails this case first.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIrModel0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testIrModel0047';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      expect(countKeys(new IrFrame())).assertEqual(IR_FRAME_FIELD_COUNT);
      expect(countKeys(new SendFrame())).assertEqual(SEND_FRAME_FIELD_COUNT);
      expect(countKeys(new SendStep())).assertEqual(SEND_STEP_FIELD_COUNT);
      expect(countKeys(new SendJob())).assertEqual(SEND_JOB_FIELD_COUNT);
      expect(countKeys(new SendProgress())).assertEqual(SEND_PROGRESS_FIELD_COUNT);
      expect(countKeys(new TransmitResult())).assertEqual(TRANSMIT_RESULT_FIELD_COUNT);
      expect(countKeys(new IrLibraryCode())).assertEqual(LIBRARY_CODE_FIELD_COUNT);
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });

    /**
     * @tc.number    SUB_MEETINGSCENE_LOGIC_IRMODEL_0147
     * @tc.name      testIrModel0048
     * @tc.desc      Verify the brand entry and library index field counts match their declared
     *               structures, which keeps the bundled library JSON contract stable.
     * @tc.require   NA
     * @tc.size      SmallTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testIrModel0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const TAG: string = 'testIrModel0048';
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' start');
      const brand: IrBrandEntry = new IrBrandEntry();
      const index: IrLibraryIndex = new IrLibraryIndex();
      expect(countKeys(brand)).assertEqual(BRAND_ENTRY_FIELD_COUNT);
      expect(countKeys(index)).assertEqual(LIBRARY_INDEX_FIELD_COUNT);
      expect(brand.deviceTypes.length).assertEqual(0);
      expect(brand.models.length).assertEqual(0);
      expect(index.brands.length).assertEqual(0);
      expect(index.version).assertEqual('');
      expect(countKeys(index) === countKeys(brand)).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', SUITE_PREFIX + TAG + ' end');
    });
  });
}
