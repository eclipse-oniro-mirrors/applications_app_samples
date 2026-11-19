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
 * WITHOUT WARRANTIES OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import RecordModel from '../../../main/ets/model/RecordModel';
import type { AudioRecorderPort } from '../../../main/ets/model/RecordModel';
import {
  RecorderContractFake, RecorderFake, RecorderFactoryFake, RecorderGate, recorderRejection, recorderTick
} from '../utils/RecorderFakes';
import { LogicTestLog } from '../utils/LogicTestLog';

export default function RecorderLifecycleLogicTest(): void {
  describe('RecorderLifecycleLogic', (): void => {
    beforeEach(async (): Promise<void> => {
      await recorderTick();
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1070
     * @tc.name UninitializedOperations1
     * @tc.desc Operations on an uninitialized recorder are safe no-ops and cannot invoke the injected factory.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1070';
        const input: string =
          'operations=release/finish/pause/resume/prepare';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        const error0: string = await recorderRejection((): Promise<void> => model.release());
        LogicTestLog.value(name, 'noOpError0', '', error0);
        expect(error0).assertEqual('');
        LogicTestLog.number(name, 'noFactoryAtStep0', 0, factory.calls);
        expect(factory.calls).assertEqual(0);
        const error1: string = await recorderRejection((): Promise<void> => model.finish());
        LogicTestLog.value(name, 'noOpError1', '', error1);
        expect(error1).assertEqual('');
        LogicTestLog.number(name, 'noFactoryAtStep1', 0, factory.calls);
        expect(factory.calls).assertEqual(0);
        const result2: void = model.pause();
        LogicTestLog.value(name, 'voidOperation2', 'undefined', String(result2));
        expect(String(result2)).assertEqual('undefined');
        LogicTestLog.number(name, 'noFactoryAtStep2', 0, factory.calls);
        expect(factory.calls).assertEqual(0);
        const result3: void = model.resume();
        LogicTestLog.value(name, 'voidOperation3', 'undefined', String(result3));
        expect(String(result3)).assertEqual('undefined');
        LogicTestLog.number(name, 'noFactoryAtStep3', 0, factory.calls);
        expect(factory.calls).assertEqual(0);
        const error4: string = await recorderRejection((): Promise<void> => model.startRecorder(4));
        LogicTestLog.value(name, 'noOpError4', '', error4);
        expect(error4).assertEqual('');
        LogicTestLog.number(name, 'noFactoryAtStep4', 0, factory.calls);
        expect(factory.calls).assertEqual(0);
        await recorderTick();
        const expectedHistory1: string[] = [
        ];
        LogicTestLog.value(name, 'emptyLifecycleHistory', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        LogicTestLog.number(name, 'noCallbacks', 0, callbacks);
        expect(callbacks).assertEqual(0);
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(401);
        LogicTestLog.number(name, 'laterInitFactory', 1, factory.calls);
        expect(factory.calls).assertEqual(1);
        LogicTestLog.number(name, 'laterInitPrepare', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        LogicTestLog.value(name, 'laterDescriptor', 'fd://401', r1.configs[0].url);
        expect(r1.configs[0].url).assertEqual('fd://401');
        await model.finish();
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'laterInitCleanup', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1071
     * @tc.name UninitializedOperations2
     * @tc.desc Operations on an uninitialized recorder are safe no-ops and cannot invoke the injected factory.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1071';
        const input: string =
          'operations=finish/finish/release/prepare/pause';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        const error0: string = await recorderRejection((): Promise<void> => model.finish());
        LogicTestLog.value(name, 'noOpError0', '', error0);
        expect(error0).assertEqual('');
        LogicTestLog.number(name, 'noFactoryAtStep0', 0, factory.calls);
        expect(factory.calls).assertEqual(0);
        const error1: string = await recorderRejection((): Promise<void> => model.finish());
        LogicTestLog.value(name, 'noOpError1', '', error1);
        expect(error1).assertEqual('');
        LogicTestLog.number(name, 'noFactoryAtStep1', 0, factory.calls);
        expect(factory.calls).assertEqual(0);
        const error2: string = await recorderRejection((): Promise<void> => model.release());
        LogicTestLog.value(name, 'noOpError2', '', error2);
        expect(error2).assertEqual('');
        LogicTestLog.number(name, 'noFactoryAtStep2', 0, factory.calls);
        expect(factory.calls).assertEqual(0);
        const error3: string = await recorderRejection((): Promise<void> => model.startRecorder(4));
        LogicTestLog.value(name, 'noOpError3', '', error3);
        expect(error3).assertEqual('');
        LogicTestLog.number(name, 'noFactoryAtStep3', 0, factory.calls);
        expect(factory.calls).assertEqual(0);
        const result4: void = model.pause();
        LogicTestLog.value(name, 'voidOperation4', 'undefined', String(result4));
        expect(String(result4)).assertEqual('undefined');
        LogicTestLog.number(name, 'noFactoryAtStep4', 0, factory.calls);
        expect(factory.calls).assertEqual(0);
        await recorderTick();
        const expectedHistory1: string[] = [
        ];
        LogicTestLog.value(name, 'emptyLifecycleHistory', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        LogicTestLog.number(name, 'noCallbacks', 0, callbacks);
        expect(callbacks).assertEqual(0);
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(402);
        LogicTestLog.number(name, 'laterInitFactory', 1, factory.calls);
        expect(factory.calls).assertEqual(1);
        LogicTestLog.number(name, 'laterInitPrepare', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        LogicTestLog.value(name, 'laterDescriptor', 'fd://402', r1.configs[0].url);
        expect(r1.configs[0].url).assertEqual('fd://402');
        await model.finish();
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'laterInitCleanup', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1072
     * @tc.name UninitializedOperations3
     * @tc.desc Operations on an uninitialized recorder are safe no-ops and cannot invoke the injected factory.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1072';
        const input: string =
          'operations=pause/resume/pause/resume/release';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        const result0: void = model.pause();
        LogicTestLog.value(name, 'voidOperation0', 'undefined', String(result0));
        expect(String(result0)).assertEqual('undefined');
        LogicTestLog.number(name, 'noFactoryAtStep0', 0, factory.calls);
        expect(factory.calls).assertEqual(0);
        const result1: void = model.resume();
        LogicTestLog.value(name, 'voidOperation1', 'undefined', String(result1));
        expect(String(result1)).assertEqual('undefined');
        LogicTestLog.number(name, 'noFactoryAtStep1', 0, factory.calls);
        expect(factory.calls).assertEqual(0);
        const result2: void = model.pause();
        LogicTestLog.value(name, 'voidOperation2', 'undefined', String(result2));
        expect(String(result2)).assertEqual('undefined');
        LogicTestLog.number(name, 'noFactoryAtStep2', 0, factory.calls);
        expect(factory.calls).assertEqual(0);
        const result3: void = model.resume();
        LogicTestLog.value(name, 'voidOperation3', 'undefined', String(result3));
        expect(String(result3)).assertEqual('undefined');
        LogicTestLog.number(name, 'noFactoryAtStep3', 0, factory.calls);
        expect(factory.calls).assertEqual(0);
        const error4: string = await recorderRejection((): Promise<void> => model.release());
        LogicTestLog.value(name, 'noOpError4', '', error4);
        expect(error4).assertEqual('');
        LogicTestLog.number(name, 'noFactoryAtStep4', 0, factory.calls);
        expect(factory.calls).assertEqual(0);
        await recorderTick();
        const expectedHistory1: string[] = [
        ];
        LogicTestLog.value(name, 'emptyLifecycleHistory', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        LogicTestLog.number(name, 'noCallbacks', 0, callbacks);
        expect(callbacks).assertEqual(0);
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(403);
        LogicTestLog.number(name, 'laterInitFactory', 1, factory.calls);
        expect(factory.calls).assertEqual(1);
        LogicTestLog.number(name, 'laterInitPrepare', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        LogicTestLog.value(name, 'laterDescriptor', 'fd://403', r1.configs[0].url);
        expect(r1.configs[0].url).assertEqual('fd://403');
        await model.finish();
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'laterInitCleanup', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1073
     * @tc.name UninitializedOperations4
     * @tc.desc Operations on an uninitialized recorder are safe no-ops and cannot invoke the injected factory.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1073';
        const input: string =
          'operations=prepare/prepare/finish/release/resume';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        const error0: string = await recorderRejection((): Promise<void> => model.startRecorder(3));
        LogicTestLog.value(name, 'noOpError0', '', error0);
        expect(error0).assertEqual('');
        LogicTestLog.number(name, 'noFactoryAtStep0', 0, factory.calls);
        expect(factory.calls).assertEqual(0);
        const error1: string = await recorderRejection((): Promise<void> => model.startRecorder(4));
        LogicTestLog.value(name, 'noOpError1', '', error1);
        expect(error1).assertEqual('');
        LogicTestLog.number(name, 'noFactoryAtStep1', 0, factory.calls);
        expect(factory.calls).assertEqual(0);
        const error2: string = await recorderRejection((): Promise<void> => model.finish());
        LogicTestLog.value(name, 'noOpError2', '', error2);
        expect(error2).assertEqual('');
        LogicTestLog.number(name, 'noFactoryAtStep2', 0, factory.calls);
        expect(factory.calls).assertEqual(0);
        const error3: string = await recorderRejection((): Promise<void> => model.release());
        LogicTestLog.value(name, 'noOpError3', '', error3);
        expect(error3).assertEqual('');
        LogicTestLog.number(name, 'noFactoryAtStep3', 0, factory.calls);
        expect(factory.calls).assertEqual(0);
        const result4: void = model.resume();
        LogicTestLog.value(name, 'voidOperation4', 'undefined', String(result4));
        expect(String(result4)).assertEqual('undefined');
        LogicTestLog.number(name, 'noFactoryAtStep4', 0, factory.calls);
        expect(factory.calls).assertEqual(0);
        await recorderTick();
        const expectedHistory1: string[] = [
        ];
        LogicTestLog.value(name, 'emptyLifecycleHistory', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        LogicTestLog.number(name, 'noCallbacks', 0, callbacks);
        expect(callbacks).assertEqual(0);
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(404);
        LogicTestLog.number(name, 'laterInitFactory', 1, factory.calls);
        expect(factory.calls).assertEqual(1);
        LogicTestLog.number(name, 'laterInitPrepare', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        LogicTestLog.value(name, 'laterDescriptor', 'fd://404', r1.configs[0].url);
        expect(r1.configs[0].url).assertEqual('fd://404');
        await model.finish();
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'laterInitCleanup', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1074
     * @tc.name FinishSuccess1
     * @tc.desc Finish releases inactive states directly and stops then resets active states under recorder
     * contract validation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1074';
        const input: string =
          'beforeFinish=idle';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderContractFake = new RecorderContractFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        LogicTestLog.number(name, 'callbacksBeforeFinish', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError'
        ];
        LogicTestLog.value(name, 'beforeFinishHistory', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        const finishError: string = await recorderRejection((): Promise<void> => model.finish());
        LogicTestLog.value(name, 'successfulFinishError', '', finishError);
        expect(finishError).assertEqual('');
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'callbacksAfterCleanup', 0, callbacks);
        expect(callbacks).assertEqual(0);
        LogicTestLog.number(name, 'contractViolations', 0, r1.contractViolations.length);
        expect(r1.contractViolations.length).assertEqual(0);
        LogicTestLog.number(name, 'stateDependentStop', 0, r1.callCount('stop'));
        expect(r1.callCount('stop')).assertEqual(0);
        LogicTestLog.number(name, 'stateDependentReset', 0, r1.callCount('reset'));
        expect(r1.callCount('reset')).assertEqual(0);
        LogicTestLog.number(name, 'singleContractRelease', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'finishClearsReference', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(601);
        r2.emitState('prepared');
        await recorderTick();
        r2.emitState('started');
        r1.emitState('started');
        LogicTestLog.number(name, 'replacementCallbacks', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'replacementPrepareCount', 1, r2.configs.length);
        expect(r2.configs.length).assertEqual(1);
        LogicTestLog.value(name, 'replacementDescriptor', 'fd://601', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://601');
        LogicTestLog.number(name, 'replacementStartCount', 1, r2.callCount('start'));
        expect(r2.callCount('start')).assertEqual(1);
        await model.release();
        const expectedHistory3: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r2.start.enter', 'r2.start.resolve', 'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory3.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory3.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1075
     * @tc.name FinishSuccess2
     * @tc.desc Finish releases inactive states directly and stops then resets active states under recorder
     * contract validation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1075';
        const input: string =
          'beforeFinish=prepare/prepared';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderContractFake = new RecorderContractFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(502);
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'callbacksBeforeFinish', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve'
        ];
        LogicTestLog.value(name, 'beforeFinishHistory', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        const finishError: string = await recorderRejection((): Promise<void> => model.finish());
        LogicTestLog.value(name, 'successfulFinishError', '', finishError);
        expect(finishError).assertEqual('');
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'callbacksAfterCleanup', 0, callbacks);
        expect(callbacks).assertEqual(0);
        LogicTestLog.number(name, 'contractViolations', 0, r1.contractViolations.length);
        expect(r1.contractViolations.length).assertEqual(0);
        LogicTestLog.number(name, 'stateDependentStop', 0, r1.callCount('stop'));
        expect(r1.callCount('stop')).assertEqual(0);
        LogicTestLog.number(name, 'stateDependentReset', 0, r1.callCount('reset'));
        expect(r1.callCount('reset')).assertEqual(0);
        LogicTestLog.number(name, 'singleContractRelease', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'finishClearsReference', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(602);
        r2.emitState('prepared');
        await recorderTick();
        r2.emitState('started');
        r1.emitState('started');
        LogicTestLog.number(name, 'replacementCallbacks', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'replacementPrepareCount', 1, r2.configs.length);
        expect(r2.configs.length).assertEqual(1);
        LogicTestLog.value(name, 'replacementDescriptor', 'fd://602', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://602');
        LogicTestLog.number(name, 'replacementStartCount', 1, r2.callCount('start'));
        expect(r2.callCount('start')).assertEqual(1);
        await model.release();
        const expectedHistory3: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r2.start.enter', 'r2.start.resolve', 'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory3.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory3.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1076
     * @tc.name FinishSuccess3
     * @tc.desc Finish releases inactive states directly and stops then resets active states under recorder
     * contract validation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1076';
        const input: string =
          'beforeFinish=prepare/prepared/started';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderContractFake = new RecorderContractFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(503);
        r1.emitState('prepared');
        await recorderTick();
        r1.emitState('started');
        await recorderTick();
        LogicTestLog.number(name, 'callbacksBeforeFinish', 1, callbacks);
        expect(callbacks).assertEqual(1);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve'
        ];
        LogicTestLog.value(name, 'beforeFinishHistory', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        const finishError: string = await recorderRejection((): Promise<void> => model.finish());
        LogicTestLog.value(name, 'successfulFinishError', '', finishError);
        expect(finishError).assertEqual('');
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'callbacksAfterCleanup', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'contractViolations', 0, r1.contractViolations.length);
        expect(r1.contractViolations.length).assertEqual(0);
        LogicTestLog.number(name, 'stateDependentStop', 1, r1.callCount('stop'));
        expect(r1.callCount('stop')).assertEqual(1);
        LogicTestLog.number(name, 'stateDependentReset', 1, r1.callCount('reset'));
        expect(r1.callCount('reset')).assertEqual(1);
        LogicTestLog.number(name, 'singleContractRelease', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.stop.enter', 'r1.stop.resolve', 'r1.reset.enter', 'r1.reset.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'finishClearsReference', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(603);
        r2.emitState('prepared');
        await recorderTick();
        r2.emitState('started');
        r1.emitState('started');
        LogicTestLog.number(name, 'replacementCallbacks', 2, callbacks);
        expect(callbacks).assertEqual(2);
        LogicTestLog.number(name, 'replacementPrepareCount', 1, r2.configs.length);
        expect(r2.configs.length).assertEqual(1);
        LogicTestLog.value(name, 'replacementDescriptor', 'fd://603', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://603');
        LogicTestLog.number(name, 'replacementStartCount', 1, r2.callCount('start'));
        expect(r2.callCount('start')).assertEqual(1);
        await model.release();
        const expectedHistory3: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.stop.enter', 'r1.stop.resolve', 'r1.reset.enter', 'r1.reset.resolve',
          'r1.release.enter', 'r1.release.resolve', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r2.start.enter', 'r2.start.resolve', 'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory3.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory3.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1077
     * @tc.name FinishSuccess4
     * @tc.desc Finish releases inactive states directly and stops then resets active states under recorder
     * contract validation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1077';
        const input: string =
          'beforeFinish=prepare/prepared/started/pause/paused';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderContractFake = new RecorderContractFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(504);
        r1.emitState('prepared');
        await recorderTick();
        r1.emitState('started');
        await recorderTick();
        model.pause();
        await recorderTick();
        r1.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'callbacksBeforeFinish', 2, callbacks);
        expect(callbacks).assertEqual(2);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.pause.enter', 'r1.pause.resolve'
        ];
        LogicTestLog.value(name, 'beforeFinishHistory', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        const finishError: string = await recorderRejection((): Promise<void> => model.finish());
        LogicTestLog.value(name, 'successfulFinishError', '', finishError);
        expect(finishError).assertEqual('');
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');