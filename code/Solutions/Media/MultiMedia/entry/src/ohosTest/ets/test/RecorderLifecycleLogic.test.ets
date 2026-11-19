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
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'callbacksAfterCleanup', 2, callbacks);
        expect(callbacks).assertEqual(2);
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
          'r1.pause.enter', 'r1.pause.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'finishClearsReference', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(604);
        r2.emitState('prepared');
        await recorderTick();
        r2.emitState('started');
        r1.emitState('started');
        LogicTestLog.number(name, 'replacementCallbacks', 3, callbacks);
        expect(callbacks).assertEqual(3);
        LogicTestLog.number(name, 'replacementPrepareCount', 1, r2.configs.length);
        expect(r2.configs.length).assertEqual(1);
        LogicTestLog.value(name, 'replacementDescriptor', 'fd://604', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://604');
        LogicTestLog.number(name, 'replacementStartCount', 1, r2.callCount('start'));
        expect(r2.callCount('start')).assertEqual(1);
        await model.release();
        const expectedHistory3: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.pause.enter', 'r1.pause.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.resolve', 'r1.release.enter', 'r1.release.resolve',
          'factory.2.enter', 'factory.2.resolve', 'r2.onStateChange', 'r2.onError',
          'r2.prepare.enter', 'r2.prepare.resolve', 'r2.start.enter', 'r2.start.resolve',
          'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory3.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory3.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1078
     * @tc.name FinishSuccess5
     * @tc.desc Finish releases inactive states directly and stops then resets active states under recorder
     * contract validation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1078';
        const input: string =
          'beforeFinish=prepare/started/pause/paused/resume/started';
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
        await model.startRecorder(505);
        r1.emitState('started');
        await recorderTick();
        model.pause();
        await recorderTick();
        r1.emitState('paused');
        await recorderTick();
        model.resume();
        await recorderTick();
        r1.emitState('started');
        await recorderTick();
        LogicTestLog.number(name, 'callbacksBeforeFinish', 3, callbacks);
        expect(callbacks).assertEqual(3);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.pause.enter', 'r1.pause.resolve',
          'r1.resume.enter', 'r1.resume.resolve'
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
        LogicTestLog.number(name, 'callbacksAfterCleanup', 3, callbacks);
        expect(callbacks).assertEqual(3);
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
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.pause.enter', 'r1.pause.resolve',
          'r1.resume.enter', 'r1.resume.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'finishClearsReference', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(605);
        r2.emitState('prepared');
        await recorderTick();
        r2.emitState('started');
        r1.emitState('started');
        LogicTestLog.number(name, 'replacementCallbacks', 4, callbacks);
        expect(callbacks).assertEqual(4);
        LogicTestLog.number(name, 'replacementPrepareCount', 1, r2.configs.length);
        expect(r2.configs.length).assertEqual(1);
        LogicTestLog.value(name, 'replacementDescriptor', 'fd://605', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://605');
        LogicTestLog.number(name, 'replacementStartCount', 1, r2.callCount('start'));
        expect(r2.callCount('start')).assertEqual(1);
        await model.release();
        const expectedHistory3: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.pause.enter', 'r1.pause.resolve',
          'r1.resume.enter', 'r1.resume.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.resolve', 'r1.release.enter', 'r1.release.resolve',
          'factory.2.enter', 'factory.2.resolve', 'r2.onStateChange', 'r2.onError',
          'r2.prepare.enter', 'r2.prepare.resolve', 'r2.start.enter', 'r2.start.resolve',
          'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory3.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory3.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1079
     * @tc.name FinishFailure1
     * @tc.desc Stop or reset failure still releases; release failure follows normal finally error precedence.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1079';
        const input: string =
          'fail=stop; prior=started';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(701);
        r1.emitState('started');
        r1.fail('stop', 'stop fault 0');
        const failure: string = await recorderRejection((): Promise<void> => model.finish());
        LogicTestLog.value(name, 'propagatedFailure', 'stop fault 0', failure);
        expect(failure).assertEqual('stop fault 0');
        LogicTestLog.number(name, 'stopAttempt', 1, r1.callCount('stop'));
        expect(r1.callCount('stop')).assertEqual(1);
        LogicTestLog.number(name, 'resetAttempt', 0, r1.callCount('reset'));
        expect(r1.callCount('reset')).assertEqual(0);
        LogicTestLog.number(name, 'releaseDespiteFailure', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.stop.enter', 'r1.stop.reject',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'failureCleanupOrder', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        r1.emitError('late finish error');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'noCallbackAfterRejectedFinish', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'noStartAfterRejectedFinish', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.stop.enter', 'r1.stop.reject',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'clearedAfterRejectedFinish', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(801);
        r2.emitState('started');
        LogicTestLog.number(name, 'recoveredCallbacks', 2, callbacks);
        expect(callbacks).assertEqual(2);
        LogicTestLog.value(name, 'recoveredDescriptor', 'fd://801', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://801');
        await model.finish();
        const expectedHistory3: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.stop.enter', 'r1.stop.reject',
          'r1.release.enter', 'r1.release.resolve', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r2.stop.enter', 'r2.stop.resolve', 'r2.reset.enter', 'r2.reset.resolve',
          'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory3.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory3.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1080
     * @tc.name FinishFailure2
     * @tc.desc Stop or reset failure still releases; release failure follows normal finally error precedence.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1080';
        const input: string =
          'fail=reset; prior=started';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(702);
        r1.emitState('started');
        r1.fail('reset', 'reset fault 1');
        const failure: string = await recorderRejection((): Promise<void> => model.finish());
        LogicTestLog.value(name, 'propagatedFailure', 'reset fault 1', failure);
        expect(failure).assertEqual('reset fault 1');
        LogicTestLog.number(name, 'stopAttempt', 1, r1.callCount('stop'));
        expect(r1.callCount('stop')).assertEqual(1);
        LogicTestLog.number(name, 'resetAttempt', 1, r1.callCount('reset'));
        expect(r1.callCount('reset')).assertEqual(1);
        LogicTestLog.number(name, 'releaseDespiteFailure', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.reject', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'failureCleanupOrder', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        r1.emitError('late finish error');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'noCallbackAfterRejectedFinish', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'noStartAfterRejectedFinish', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.reject', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'clearedAfterRejectedFinish', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(802);
        r2.emitState('started');
        LogicTestLog.number(name, 'recoveredCallbacks', 2, callbacks);
        expect(callbacks).assertEqual(2);
        LogicTestLog.value(name, 'recoveredDescriptor', 'fd://802', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://802');
        await model.finish();
        const expectedHistory3: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.reject', 'r1.release.enter', 'r1.release.resolve',
          'factory.2.enter', 'factory.2.resolve', 'r2.onStateChange', 'r2.onError',
          'r2.prepare.enter', 'r2.prepare.resolve', 'r2.stop.enter', 'r2.stop.resolve',
          'r2.reset.enter', 'r2.reset.resolve', 'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory3.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory3.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1081
     * @tc.name FinishFailure3
     * @tc.desc Stop or reset failure still releases; release failure follows normal finally error precedence.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1081';
        const input: string =
          'fail=release; prior=started';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(703);
        r1.emitState('started');
        r1.fail('release', 'release fault 2');
        const failure: string = await recorderRejection((): Promise<void> => model.finish());
        LogicTestLog.value(name, 'propagatedFailure', 'release fault 2', failure);
        expect(failure).assertEqual('release fault 2');
        LogicTestLog.number(name, 'stopAttempt', 1, r1.callCount('stop'));
        expect(r1.callCount('stop')).assertEqual(1);
        LogicTestLog.number(name, 'resetAttempt', 1, r1.callCount('reset'));
        expect(r1.callCount('reset')).assertEqual(1);
        LogicTestLog.number(name, 'releaseDespiteFailure', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.resolve', 'r1.release.enter', 'r1.release.reject'
        ];
        LogicTestLog.value(name, 'failureCleanupOrder', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        r1.emitError('late finish error');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'noCallbackAfterRejectedFinish', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'noStartAfterRejectedFinish', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.resolve', 'r1.release.enter', 'r1.release.reject'
        ];
        LogicTestLog.value(name, 'clearedAfterRejectedFinish', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(803);
        r2.emitState('started');
        LogicTestLog.number(name, 'recoveredCallbacks', 2, callbacks);
        expect(callbacks).assertEqual(2);
        LogicTestLog.value(name, 'recoveredDescriptor', 'fd://803', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://803');
        await model.finish();
        const expectedHistory3: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.resolve', 'r1.release.enter', 'r1.release.reject',
          'factory.2.enter', 'factory.2.resolve', 'r2.onStateChange', 'r2.onError',
          'r2.prepare.enter', 'r2.prepare.resolve', 'r2.stop.enter', 'r2.stop.resolve',
          'r2.reset.enter', 'r2.reset.resolve', 'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory3.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory3.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1082
     * @tc.name FinishFailure4
     * @tc.desc Stop or reset failure still releases; release failure follows normal finally error precedence.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1082';
        const input: string =
          'fail=stop/release; prior=started';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(704);
        r1.emitState('started');
        r1.fail('stop', 'stop fault 3');
        r1.fail('release', 'release fault 3');
        const failure: string = await recorderRejection((): Promise<void> => model.finish());
        LogicTestLog.value(name, 'propagatedFailure', 'release fault 3', failure);
        expect(failure).assertEqual('release fault 3');
        LogicTestLog.number(name, 'stopAttempt', 1, r1.callCount('stop'));
        expect(r1.callCount('stop')).assertEqual(1);
        LogicTestLog.number(name, 'resetAttempt', 0, r1.callCount('reset'));
        expect(r1.callCount('reset')).assertEqual(0);
        LogicTestLog.number(name, 'releaseDespiteFailure', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.stop.enter', 'r1.stop.reject',
          'r1.release.enter', 'r1.release.reject'
        ];
        LogicTestLog.value(name, 'failureCleanupOrder', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        r1.emitError('late finish error');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'noCallbackAfterRejectedFinish', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'noStartAfterRejectedFinish', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.stop.enter', 'r1.stop.reject',
          'r1.release.enter', 'r1.release.reject'
        ];
        LogicTestLog.value(name, 'clearedAfterRejectedFinish', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(804);
        r2.emitState('started');
        LogicTestLog.number(name, 'recoveredCallbacks', 2, callbacks);
        expect(callbacks).assertEqual(2);
        LogicTestLog.value(name, 'recoveredDescriptor', 'fd://804', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://804');
        await model.finish();
        const expectedHistory3: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.stop.enter', 'r1.stop.reject',
          'r1.release.enter', 'r1.release.reject', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r2.stop.enter', 'r2.stop.resolve', 'r2.reset.enter', 'r2.reset.resolve',
          'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory3.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory3.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1083
     * @tc.name FinishFailure5
     * @tc.desc Stop or reset failure still releases; release failure follows normal finally error precedence.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1083';
        const input: string =
          'fail=reset/release; prior=started';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(705);
        r1.emitState('started');
        r1.fail('reset', 'reset fault 4');
        r1.fail('release', 'release fault 4');
        const failure: string = await recorderRejection((): Promise<void> => model.finish());
        LogicTestLog.value(name, 'propagatedFailure', 'release fault 4', failure);
        expect(failure).assertEqual('release fault 4');
        LogicTestLog.number(name, 'stopAttempt', 1, r1.callCount('stop'));
        expect(r1.callCount('stop')).assertEqual(1);
        LogicTestLog.number(name, 'resetAttempt', 1, r1.callCount('reset'));
        expect(r1.callCount('reset')).assertEqual(1);
        LogicTestLog.number(name, 'releaseDespiteFailure', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.reject', 'r1.release.enter', 'r1.release.reject'
        ];
        LogicTestLog.value(name, 'failureCleanupOrder', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        r1.emitError('late finish error');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'noCallbackAfterRejectedFinish', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'noStartAfterRejectedFinish', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.reject', 'r1.release.enter', 'r1.release.reject'
        ];
        LogicTestLog.value(name, 'clearedAfterRejectedFinish', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(805);
        r2.emitState('started');
        LogicTestLog.number(name, 'recoveredCallbacks', 2, callbacks);
        expect(callbacks).assertEqual(2);
        LogicTestLog.value(name, 'recoveredDescriptor', 'fd://805', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://805');
        await model.finish();
        const expectedHistory3: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.reject', 'r1.release.enter', 'r1.release.reject',
          'factory.2.enter', 'factory.2.resolve', 'r2.onStateChange', 'r2.onError',
          'r2.prepare.enter', 'r2.prepare.resolve', 'r2.stop.enter', 'r2.stop.resolve',
          'r2.reset.enter', 'r2.reset.resolve', 'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory3.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory3.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1084
     * @tc.name FinishFailure6
     * @tc.desc Stop or reset failure still releases; release failure follows normal finally error precedence.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1084';
        const input: string =
          'fail=stop/reset/release; prior=started';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(706);
        r1.emitState('started');
        r1.fail('stop', 'stop fault 5');
        r1.fail('reset', 'reset fault 5');
        r1.fail('release', 'release fault 5');
        const failure: string = await recorderRejection((): Promise<void> => model.finish());
        LogicTestLog.value(name, 'propagatedFailure', 'release fault 5', failure);
        expect(failure).assertEqual('release fault 5');
        LogicTestLog.number(name, 'stopAttempt', 1, r1.callCount('stop'));
        expect(r1.callCount('stop')).assertEqual(1);
        LogicTestLog.number(name, 'resetAttempt', 0, r1.callCount('reset'));
        expect(r1.callCount('reset')).assertEqual(0);
        LogicTestLog.number(name, 'releaseDespiteFailure', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.stop.enter', 'r1.stop.reject',
          'r1.release.enter', 'r1.release.reject'
        ];
        LogicTestLog.value(name, 'failureCleanupOrder', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        r1.emitError('late finish error');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'noCallbackAfterRejectedFinish', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'noStartAfterRejectedFinish', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.stop.enter', 'r1.stop.reject',
          'r1.release.enter', 'r1.release.reject'
        ];
        LogicTestLog.value(name, 'clearedAfterRejectedFinish', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(806);
        r2.emitState('started');
        LogicTestLog.number(name, 'recoveredCallbacks', 2, callbacks);
        expect(callbacks).assertEqual(2);
        LogicTestLog.value(name, 'recoveredDescriptor', 'fd://806', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://806');
        await model.finish();
        const expectedHistory3: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.stop.enter', 'r1.stop.reject',
          'r1.release.enter', 'r1.release.reject', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r2.stop.enter', 'r2.stop.resolve', 'r2.reset.enter', 'r2.reset.resolve',
          'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory3.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory3.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1085
     * @tc.name FinishFailure7
     * @tc.desc Stop or reset failure still releases; release failure follows normal finally error precedence.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1085';
        const input: string =
          'fail=stop; prior=pause';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(707);
        r1.emitState('started');
        model.pause();
        await recorderTick();
        r1.fail('stop', 'stop fault 6');
        const failure: string = await recorderRejection((): Promise<void> => model.finish());
        LogicTestLog.value(name, 'propagatedFailure', 'stop fault 6', failure);
        expect(failure).assertEqual('stop fault 6');
        LogicTestLog.number(name, 'stopAttempt', 1, r1.callCount('stop'));
        expect(r1.callCount('stop')).assertEqual(1);
        LogicTestLog.number(name, 'resetAttempt', 0, r1.callCount('reset'));
        expect(r1.callCount('reset')).assertEqual(0);
        LogicTestLog.number(name, 'releaseDespiteFailure', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.pause.enter', 'r1.pause.resolve',
          'r1.stop.enter', 'r1.stop.reject', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'failureCleanupOrder', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        r1.emitError('late finish error');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'noCallbackAfterRejectedFinish', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'noStartAfterRejectedFinish', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.pause.enter', 'r1.pause.resolve',
          'r1.stop.enter', 'r1.stop.reject', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'clearedAfterRejectedFinish', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(807);
        r2.emitState('started');
        LogicTestLog.number(name, 'recoveredCallbacks', 2, callbacks);
        expect(callbacks).assertEqual(2);
        LogicTestLog.value(name, 'recoveredDescriptor', 'fd://807', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://807');
        await model.finish();
        const expectedHistory3: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.pause.enter', 'r1.pause.resolve',
          'r1.stop.enter', 'r1.stop.reject', 'r1.release.enter', 'r1.release.resolve',
          'factory.2.enter', 'factory.2.resolve', 'r2.onStateChange', 'r2.onError',
          'r2.prepare.enter', 'r2.prepare.resolve', 'r2.stop.enter', 'r2.stop.resolve',
          'r2.reset.enter', 'r2.reset.resolve', 'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory3.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory3.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1086
     * @tc.name ReleaseLifecycle1
     * @tc.desc Release clears immediately, awaits completion, propagates failure, and never releases the same
     * handle twice.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1086';
        const input: string =
          'state=idle; gated=false; failure=none';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        const failure: string = await recorderRejection((): Promise<void> => model.release());
        LogicTestLog.value(name, 'releaseFailure', '', failure);
        expect(failure).assertEqual('');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'singleOldRelease', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        LogicTestLog.number(name, 'oldCallbacksRetained', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'releaseSettled', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(901);
        r1.emitState('started');
        r2.emitState('started');
        LogicTestLog.number(name, 'replacementCallbacksOnly', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.value(name, 'replacementDescriptor', 'fd://901', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://901');
        await model.finish();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r2.stop.enter', 'r2.stop.resolve', 'r2.reset.enter', 'r2.reset.resolve',
          'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1087
     * @tc.name ReleaseLifecycle2
     * @tc.desc Release clears immediately, awaits completion, propagates failure, and never releases the same
     * handle twice.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1087';
        const input: string =
          'state=idle; gated=false; failure=Release service rejected';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        r1.fail('release', 'Release service rejected');
        const failure: string = await recorderRejection((): Promise<void> => model.release());
        LogicTestLog.value(name, 'releaseFailure', 'Release service rejected', failure);
        expect(failure).assertEqual('Release service rejected');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'singleOldRelease', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        LogicTestLog.number(name, 'oldCallbacksRetained', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.reject'
        ];
        LogicTestLog.value(name, 'releaseSettled', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(902);
        r1.emitState('started');
        r2.emitState('started');
        LogicTestLog.number(name, 'replacementCallbacksOnly', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.value(name, 'replacementDescriptor', 'fd://902', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://902');
        await model.finish();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.reject', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r2.stop.enter', 'r2.stop.resolve', 'r2.reset.enter', 'r2.reset.resolve',
          'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1088
     * @tc.name ReleaseLifecycle3
     * @tc.desc Release clears immediately, awaits completion, propagates failure, and never releases the same
     * handle twice.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1088';
        const input: string =
          'state=prepared; gated=false; failure=Release handle rejected';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        r1.emitState('prepared');
        await recorderTick();
        r1.fail('release', 'Release handle rejected');
        const failure: string = await recorderRejection((): Promise<void> => model.release());
        LogicTestLog.value(name, 'releaseFailure', 'Release handle rejected', failure);
        expect(failure).assertEqual('Release handle rejected');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'singleOldRelease', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        LogicTestLog.number(name, 'oldCallbacksRetained', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.start.enter', 'r1.start.resolve', 'r1.release.enter', 'r1.release.reject'
        ];
        LogicTestLog.value(name, 'releaseSettled', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(903);
        r1.emitState('started');
        r2.emitState('started');
        LogicTestLog.number(name, 'replacementCallbacksOnly', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.value(name, 'replacementDescriptor', 'fd://903', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://903');
        await model.finish();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.start.enter', 'r1.start.resolve', 'r1.release.enter', 'r1.release.reject',
          'factory.2.enter', 'factory.2.resolve', 'r2.onStateChange', 'r2.onError',
          'r2.prepare.enter', 'r2.prepare.resolve', 'r2.stop.enter', 'r2.stop.resolve',
          'r2.reset.enter', 'r2.reset.resolve', 'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1089
     * @tc.name ReleaseLifecycle4
     * @tc.desc Release clears immediately, awaits completion, propagates failure, and never releases the same
     * handle twice.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1089';
        const input: string =
          'state=paused; gated=true; failure=none';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        r1.emitState('paused');
        await recorderTick();
        const gate: RecorderGate = new RecorderGate();
        r1.defer('release', gate);
        let completed: boolean = false;
        let failure: string = '';
        const releasing: Promise<void> = model.release().then((): void => {
          completed = true;
        }, (error: Error): void => {
          failure = error.message;
        });
        await recorderTick();
        LogicTestLog.flag(name, 'releasePendingExpectedFalse', completed);
        expect(completed).assertFalse();
        LogicTestLog.value(name, 'pendingReleaseFailure', '', failure);
        expect(failure).assertEqual('');
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await recorderTick();
        LogicTestLog.number(name, 'noPrepareDuringRelease', 0, r1.configs.length);
        expect(r1.configs.length).assertEqual(0);
        LogicTestLog.number(name, 'callbacksIgnoredDuringRelease', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'startIgnoredDuringRelease', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter'
        ];
        LogicTestLog.value(name, 'releasePendingClearedReference', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        gate.open();
        await releasing;
        LogicTestLog.flag(name, 'releaseCompletedExpectedTrue', completed);
        expect(completed).assertTrue();
        LogicTestLog.value(name, 'releaseFailure', '', failure);
        expect(failure).assertEqual('');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'singleOldRelease', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        LogicTestLog.number(name, 'oldCallbacksRetained', 1, callbacks);
        expect(callbacks).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'releaseSettled', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(904);
        r1.emitState('started');
        r2.emitState('started');
        LogicTestLog.number(name, 'replacementCallbacksOnly', 2, callbacks);
        expect(callbacks).assertEqual(2);
        LogicTestLog.value(name, 'replacementDescriptor', 'fd://904', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://904');
        await model.finish();
        const expectedHistory3: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r2.stop.enter', 'r2.stop.resolve', 'r2.reset.enter', 'r2.reset.resolve',
          'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory3.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory3.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1090
     * @tc.name ReleaseLifecycle5
     * @tc.desc Release clears immediately, awaits completion, propagates failure, and never releases the same
     * handle twice.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1090';
        const input: string =
          'state=started; gated=true; failure=Release delayed fault';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        r1.emitState('started');
        await recorderTick();
        r1.fail('release', 'Release delayed fault');
        const gate: RecorderGate = new RecorderGate();
        r1.defer('release', gate);
        let completed: boolean = false;
        let failure: string = '';
        const releasing: Promise<void> = model.release().then((): void => {
          completed = true;
        }, (error: Error): void => {
          failure = error.message;
        });
        await recorderTick();
        LogicTestLog.flag(name, 'releasePendingExpectedFalse', completed);
        expect(completed).assertFalse();
        LogicTestLog.value(name, 'pendingReleaseFailure', '', failure);
        expect(failure).assertEqual('');
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await recorderTick();
        LogicTestLog.number(name, 'noPrepareDuringRelease', 0, r1.configs.length);
        expect(r1.configs.length).assertEqual(0);
        LogicTestLog.number(name, 'callbacksIgnoredDuringRelease', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'startIgnoredDuringRelease', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter'
        ];
        LogicTestLog.value(name, 'releasePendingClearedReference', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        gate.open();
        await releasing;
        LogicTestLog.flag(name, 'releaseCompletedExpectedFalse', completed);
        expect(completed).assertFalse();
        LogicTestLog.value(name, 'releaseFailure', 'Release delayed fault', failure);
        expect(failure).assertEqual('Release delayed fault');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'singleOldRelease', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        LogicTestLog.number(name, 'oldCallbacksRetained', 1, callbacks);
        expect(callbacks).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.reject'
        ];
        LogicTestLog.value(name, 'releaseSettled', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(905);
        r1.emitState('started');
        r2.emitState('started');
        LogicTestLog.number(name, 'replacementCallbacksOnly', 2, callbacks);
        expect(callbacks).assertEqual(2);
        LogicTestLog.value(name, 'replacementDescriptor', 'fd://905', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://905');
        await model.finish();
        const expectedHistory3: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.reject', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r2.stop.enter', 'r2.stop.resolve', 'r2.reset.enter', 'r2.reset.resolve',
          'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory3.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory3.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1091
     * @tc.name ReinitAwaitsPreviousRelease
     * @tc.desc Reinitialization cannot request a replacement until the previous release has completed.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1091';
        const input: string =
          'previousRelease=blocked; nextFactory=success';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        r1.emitState('started');
        const gate: RecorderGate = new RecorderGate();
        r1.defer('release', gate);
        let initialized: boolean = false;
        const replacing: Promise<void> = model.initAudioRecorder((): void => {
          callbacks++;
        }).then((): void => {
          initialized = true;
        });
        await recorderTick();
        LogicTestLog.flag(name, 'replacementPendingExpectedFalse', initialized);
        expect(initialized).assertFalse();
        LogicTestLog.number(name, 'factoryBeforePreviousRelease', 1, factory.calls);
        expect(factory.calls).assertEqual(1);
        LogicTestLog.number(name, 'oldReleaseEntered', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await recorderTick();
        LogicTestLog.number(name, 'noPrepareWhileReplacing', 0, r1.configs.length);
        expect(r1.configs.length).assertEqual(0);
        LogicTestLog.number(name, 'oldCallbacksIgnoredWhileReplacing', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'oldStartsIgnoredWhileReplacing', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter'
        ];
        LogicTestLog.value(name, 'blockedReplacementHistory', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        gate.open();
        await replacing;
        LogicTestLog.flag(name, 'replacementCompleteExpectedTrue', initialized);
        expect(initialized).assertTrue();
        LogicTestLog.number(name, 'factoryAfterPreviousRelease', 2, factory.calls);
        expect(factory.calls).assertEqual(2);
        await model.startRecorder(1001);
        r1.emitState('prepared');
        r2.emitState('prepared');
        await recorderTick();
        r2.emitState('started');
        LogicTestLog.number(name, 'replacementCallbacks', 2, callbacks);
        expect(callbacks).assertEqual(2);
        LogicTestLog.number(name, 'oldStartsStillZero', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'replacementStarts', 1, r2.callCount('start'));
        expect(r2.callCount('start')).assertEqual(1);
        LogicTestLog.value(name, 'replacementDescriptor', 'fd://1001', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://1001');
        await model.finish();
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r2.start.enter', 'r2.start.resolve', 'r2.stop.enter', 'r2.stop.resolve',
          'r2.reset.enter', 'r2.reset.resolve', 'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1092
     * @tc.name ReinitPreviousReleaseRejects
     * @tc.desc Previous release failure propagates before factory invocation while the old reference remains
     * cleared.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1092';
        const input: string =
          'previousRelease=blocked/rejected; retry=success';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        const gate: RecorderGate = new RecorderGate();
        r1.defer('release', gate);
        r1.fail('release', 'Previous recorder release rejected');
        const replacing: Promise<string> = recorderRejection((): Promise<void> =>
          model.initAudioRecorder((): void => { callbacks++; }));
        await recorderTick();
        LogicTestLog.number(name, 'noPrematureReplacementFactory', 1, factory.calls);
        expect(factory.calls).assertEqual(1);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter'
        ];
        LogicTestLog.value(name, 'previousReleasePending', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        r1.emitState('started');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await recorderTick();
        LogicTestLog.number(name, 'noPrepareDuringFailedReinit', 0, r1.configs.length);
        expect(r1.configs.length).assertEqual(0);
        LogicTestLog.number(name, 'noOldCallbackDuringFailedReinit', 0, callbacks);
        expect(callbacks).assertEqual(0);
        LogicTestLog.number(name, 'noOldStartDuringFailedReinit', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        gate.open();
        const failure: string = await replacing;
        LogicTestLog.value(name, 'previousReleaseFailure', 'Previous recorder release rejected', failure);
        expect(failure).assertEqual('Previous recorder release rejected');
        LogicTestLog.number(name, 'factoryStillNotInvoked', 1, factory.calls);
        expect(factory.calls).assertEqual(1);
        LogicTestLog.number(name, 'onePreviousRelease', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.reject'
        ];
        LogicTestLog.value(name, 'failedReinitHistory', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(1002);
        r2.emitState('started');
        r1.emitState('started');
        LogicTestLog.number(name, 'retryFactory', 2, factory.calls);
        expect(factory.calls).assertEqual(2);
        LogicTestLog.number(name, 'retryCallback', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.value(name, 'retryDescriptor', 'fd://1002', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://1002');
        LogicTestLog.number(name, 'oldReleaseNotRetried', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        await model.finish();
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory3: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.reject', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r2.stop.enter', 'r2.stop.resolve', 'r2.reset.enter', 'r2.reset.resolve',
          'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory3.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory3.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1093
     * @tc.name FactoryFailureAt1
     * @tc.desc Factory rejection is observable, leaves no recorder installed, and permits a subsequent successful
     * factory.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1093';
        const input: string =
          'failedFactory=1; laterRetry=success';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const r3: RecorderFake = new RecorderFake('r3', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2, r3], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        factory.fail(1, 'Factory rejection at 1');
        const failure: string = await recorderRejection((): Promise<void> =>
          model.initAudioRecorder((): void => { callbacks++; }));
        LogicTestLog.value(name, 'factoryFailure', 'Factory rejection at 1', failure);
        expect(failure).assertEqual('Factory rejection at 1');
        LogicTestLog.number(name, 'attemptedFactoryCount', 1, factory.calls);
        expect(factory.calls).assertEqual(1);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        r1.emitState('prepared');
        r1.emitState('started');
        r2.emitState('started');
        await recorderTick();
        LogicTestLog.number(name, 'noCallbackFromFailedFactory', 0, callbacks);
        expect(callbacks).assertEqual(0);
        LogicTestLog.number(name, 'oldStartNotCalled', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'failedCandidatePrepareCount', 0, r1.configs.length);
        expect(r1.configs.length).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.reject'
        ];
        LogicTestLog.value(name, 'failedFactoryCleanup', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(1103);
        r2.emitState('prepared');
        await recorderTick();
        r2.emitState('started');
        LogicTestLog.number(name, 'retriedFactoryCount', 2, factory.calls);
        expect(factory.calls).assertEqual(2);
        LogicTestLog.number(name, 'retriedCallbacks', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'retriedPrepareCount', 1, r2.configs.length);
        expect(r2.configs.length).assertEqual(1);
        LogicTestLog.value(name, 'retriedDescriptor', 'fd://1103', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://1103');
        LogicTestLog.number(name, 'retriedStartCount', 1, r2.callCount('start'));
        expect(r2.callCount('start')).assertEqual(1);
        await model.finish();
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.reject', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r2.start.enter', 'r2.start.resolve', 'r2.stop.enter', 'r2.stop.resolve',
          'r2.reset.enter', 'r2.reset.resolve', 'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1094
     * @tc.name FactoryFailureAt2
     * @tc.desc Factory rejection is observable, leaves no recorder installed, and permits a subsequent successful
     * factory.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1094';
        const input: string =
          'failedFactory=2; laterRetry=success';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const r3: RecorderFake = new RecorderFake('r3', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2, r3], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(1101);
        r1.emitState('started');
        factory.fail(2, 'Factory rejection at 2');
        const failure: string = await recorderRejection((): Promise<void> =>
          model.initAudioRecorder((): void => { callbacks++; }));
        LogicTestLog.value(name, 'factoryFailure', 'Factory rejection at 2', failure);
        expect(failure).assertEqual('Factory rejection at 2');
        LogicTestLog.number(name, 'attemptedFactoryCount', 2, factory.calls);
        expect(factory.calls).assertEqual(2);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        r1.emitState('prepared');
        r1.emitState('started');
        r2.emitState('started');
        await recorderTick();
        LogicTestLog.number(name, 'noCallbackFromFailedFactory', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'oldStartNotCalled', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'failedCandidatePrepareCount', 0, r2.configs.length);
        expect(r2.configs.length).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.release.enter', 'r1.release.resolve',
          'factory.2.enter', 'factory.2.reject'
        ];
        LogicTestLog.value(name, 'failedFactoryCleanup', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(1104);
        r3.emitState('prepared');
        await recorderTick();
        r3.emitState('started');
        LogicTestLog.number(name, 'retriedFactoryCount', 3, factory.calls);
        expect(factory.calls).assertEqual(3);
        LogicTestLog.number(name, 'retriedCallbacks', 2, callbacks);
        expect(callbacks).assertEqual(2);
        LogicTestLog.number(name, 'retriedPrepareCount', 1, r3.configs.length);
        expect(r3.configs.length).assertEqual(1);
        LogicTestLog.value(name, 'retriedDescriptor', 'fd://1104', r3.configs[0].url);
        expect(r3.configs[0].url).assertEqual('fd://1104');
        LogicTestLog.number(name, 'retriedStartCount', 1, r3.callCount('start'));
        expect(r3.callCount('start')).assertEqual(1);
        await model.finish();
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.release.enter', 'r1.release.resolve',
          'factory.2.enter', 'factory.2.reject', 'factory.3.enter', 'factory.3.resolve',
          'r3.onStateChange', 'r3.onError', 'r3.prepare.enter', 'r3.prepare.resolve',
          'r3.start.enter', 'r3.start.resolve', 'r3.stop.enter', 'r3.stop.resolve',
          'r3.reset.enter', 'r3.reset.resolve', 'r3.release.enter', 'r3.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1095
     * @tc.name ReplacementFactoryPending
     * @tc.desc A pending replacement factory leaves no old recorder reachable and registers callbacks only after
     * resolution.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1095';
        const input: string =
          'previousRelease=success; factory2=blocked';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        const gate: RecorderGate = new RecorderGate();
        factory.defer(2, gate);
        let initialized: boolean = false;
        const replacing: Promise<void> = model.initAudioRecorder((): void => {
          callbacks++;
        }).then((): void => {
          initialized = true;
        });
        await recorderTick();
        LogicTestLog.flag(name, 'factoryPendingExpectedFalse', initialized);
        expect(initialized).assertFalse();
        LogicTestLog.number(name, 'replacementFactoryEntered', 2, factory.calls);
        expect(factory.calls).assertEqual(2);
        LogicTestLog.number(name, 'previousReleaseCompleted', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        r1.emitState('prepared');
        r1.emitState('started');
        r2.emitState('prepared');
        r2.emitState('started');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await recorderTick();
        LogicTestLog.number(name, 'noCallbackWhileFactoryPending', 0, callbacks);
        expect(callbacks).assertEqual(0);
        LogicTestLog.number(name, 'oldStartIgnored', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'newStartBeforeRegistration', 0, r2.callCount('start'));
        expect(r2.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'newPrepareBeforeFactoryResolution', 0, r2.configs.length);
        expect(r2.configs.length).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve', 'factory.2.enter'
        ];
        LogicTestLog.value(name, 'pendingFactoryCalls', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        gate.open();
        await replacing;
        LogicTestLog.flag(name, 'factoryCompleteExpectedTrue', initialized);
        expect(initialized).assertTrue();
        await model.startRecorder(1201);
        r2.emitState('prepared');
        await recorderTick();
        r2.emitState('started');
        r1.emitState('paused');
        LogicTestLog.number(name, 'newCallbacksAfterResolution', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'newStartAfterResolution', 1, r2.callCount('start'));
        expect(r2.callCount('start')).assertEqual(1);
        LogicTestLog.value(name, 'newDescriptorAfterResolution', 'fd://1201', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://1201');
        await model.finish();
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r2.start.enter', 'r2.start.resolve', 'r2.stop.enter', 'r2.stop.resolve',
          'r2.reset.enter', 'r2.reset.resolve', 'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1096
     * @tc.name ReinitRoutesDistinctCallbacks
     * @tc.desc Sequential replacements retain only the newest callback closure and never route an old prepared
     * event.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1096';
        const input: string =
          'callbacks=original/replacement/third';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const r3: RecorderFake = new RecorderFake('r3', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2, r3], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        r1.emitState('started');
        let secondCallbacks: number = 0;
        await model.initAudioRecorder((): void => {
          secondCallbacks++;
        });
        r1.emitState('prepared');
        r1.emitState('paused');
        r2.emitState('started');
        r2.emitState('paused');
        let thirdCallbacks: number = 0;
        await model.initAudioRecorder((): void => {
          thirdCallbacks++;
        });
        r1.emitState('prepared');
        r2.emitState('prepared');
        r2.emitState('started');
        r3.emitState('prepared');
        await recorderTick();
        r3.emitState('started');
        r3.emitState('paused');
        LogicTestLog.number(name, 'originalClosureCount', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'secondClosureCount', 2, secondCallbacks);
        expect(secondCallbacks).assertEqual(2);
        LogicTestLog.number(name, 'thirdClosureCount', 2, thirdCallbacks);
        expect(thirdCallbacks).assertEqual(2);
        LogicTestLog.number(name, 'oldStartCount', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'secondStartCount', 0, r2.callCount('start'));
        expect(r2.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'thirdStartCount', 1, r3.callCount('start'));
        expect(r3.callCount('start')).assertEqual(1);
        LogicTestLog.number(name, 'threeFactoryCalls', 3, factory.calls);
        expect(factory.calls).assertEqual(3);
        LogicTestLog.number(name, 'firstReleasedOnce', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        LogicTestLog.number(name, 'secondReleasedOnce', 1, r2.callCount('release'));
        expect(r2.callCount('release')).assertEqual(1);
        await model.startRecorder(1301);
        LogicTestLog.value(name, 'thirdDescriptor', 'fd://1301', r3.configs[0].url);
        expect(r3.configs[0].url).assertEqual('fd://1301');
        LogicTestLog.number(name, 'firstNeverPrepared', 0, r1.configs.length);
        expect(r1.configs.length).assertEqual(0);
        LogicTestLog.number(name, 'secondNeverPrepared', 0, r2.configs.length);
        expect(r2.configs.length).assertEqual(0);
        await model.finish();
        r3.emitState('started');
        r2.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'thirdCallbacksAfterFinish', 2, thirdCallbacks);
        expect(thirdCallbacks).assertEqual(2);
        LogicTestLog.number(name, 'secondCallbacksAfterFinish', 2, secondCallbacks);
        expect(secondCallbacks).assertEqual(2);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.release.enter', 'r2.release.resolve',
          'factory.3.enter', 'factory.3.resolve', 'r3.onStateChange', 'r3.onError',
          'r3.start.enter', 'r3.start.resolve', 'r3.prepare.enter', 'r3.prepare.resolve',
          'r3.stop.enter', 'r3.stop.resolve', 'r3.reset.enter', 'r3.reset.resolve',
          'r3.release.enter', 'r3.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1097
     * @tc.name VoidRejection1
     * @tc.desc Void pause and resume log promise rejections, retain their recorder, and permit later successful
     * commands.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1097';
        const input: string =
          'rejectCommands=pause';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(1401);
        r1.emitState('started');
        r1.fail('pause', 'pause promise rejected 0');
        const result0: void = model.pause();
        await recorderTick();
        LogicTestLog.value(name, 'failedVoidResult0', 'undefined', String(result0));
        expect(String(result0)).assertEqual('undefined');
        LogicTestLog.number(name, 'noSyntheticCallback0', 1, callbacks);
        expect(callbacks).assertEqual(1);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.pause.enter', 'r1.pause.reject'
        ];
        LogicTestLog.value(name, 'handledVoidRejections', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.recover('pause');
        const recovered0: void = model.pause();
        await recorderTick();
        LogicTestLog.value(name, 'recoveredVoidResult0', 'undefined', String(recovered0));
        expect(String(recovered0)).assertEqual('undefined');
        r1.emitState('paused');
        r1.emitState('started');
        LogicTestLog.number(name, 'realCallbacksAfterRecovery', 3, callbacks);
        expect(callbacks).assertEqual(3);
        LogicTestLog.value(name, 'descriptorAfterVoidFailures', 'fd://1401', r1.configs[0].url);
        expect(r1.configs[0].url).assertEqual('fd://1401');
        await model.finish();
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'callbacksAfterCleanup', 3, callbacks);
        expect(callbacks).assertEqual(3);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.pause.enter', 'r1.pause.reject',
          'r1.pause.enter', 'r1.pause.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'voidRecoveryAndCleanup', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1098
     * @tc.name VoidRejection2
     * @tc.desc Void pause and resume log promise rejections, retain their recorder, and permit later successful
     * commands.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1098';
        const input: string =
          'rejectCommands=resume';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(1402);
        r1.emitState('started');
        r1.fail('resume', 'resume promise rejected 1');
        const result0: void = model.resume();
        await recorderTick();
        LogicTestLog.value(name, 'failedVoidResult0', 'undefined', String(result0));
        expect(String(result0)).assertEqual('undefined');
        LogicTestLog.number(name, 'noSyntheticCallback0', 1, callbacks);
        expect(callbacks).assertEqual(1);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.resume.enter', 'r1.resume.reject'
        ];
        LogicTestLog.value(name, 'handledVoidRejections', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.recover('resume');
        const recovered0: void = model.resume();
        await recorderTick();
        LogicTestLog.value(name, 'recoveredVoidResult0', 'undefined', String(recovered0));
        expect(String(recovered0)).assertEqual('undefined');
        r1.emitState('paused');
        r1.emitState('started');
        LogicTestLog.number(name, 'realCallbacksAfterRecovery', 3, callbacks);
        expect(callbacks).assertEqual(3);
        LogicTestLog.value(name, 'descriptorAfterVoidFailures', 'fd://1402', r1.configs[0].url);
        expect(r1.configs[0].url).assertEqual('fd://1402');
        await model.finish();
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'callbacksAfterCleanup', 3, callbacks);
        expect(callbacks).assertEqual(3);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.resume.enter', 'r1.resume.reject',
          'r1.resume.enter', 'r1.resume.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'voidRecoveryAndCleanup', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1099
     * @tc.name VoidRejection3
     * @tc.desc Void pause and resume log promise rejections, retain their recorder, and permit later successful
     * commands.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1099';
        const input: string =
          'rejectCommands=pause/resume';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(1403);
        r1.emitState('started');
        r1.fail('pause', 'pause promise rejected 2');
        r1.fail('resume', 'resume promise rejected 2');
        const result0: void = model.pause();
        await recorderTick();
        LogicTestLog.value(name, 'failedVoidResult0', 'undefined', String(result0));
        expect(String(result0)).assertEqual('undefined');
        LogicTestLog.number(name, 'noSyntheticCallback0', 1, callbacks);
        expect(callbacks).assertEqual(1);
        const result1: void = model.resume();
        await recorderTick();
        LogicTestLog.value(name, 'failedVoidResult1', 'undefined', String(result1));
        expect(String(result1)).assertEqual('undefined');
        LogicTestLog.number(name, 'noSyntheticCallback1', 1, callbacks);
        expect(callbacks).assertEqual(1);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.pause.enter', 'r1.pause.reject',
          'r1.resume.enter', 'r1.resume.reject'
        ];
        LogicTestLog.value(name, 'handledVoidRejections', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.recover('pause');
        const recovered0: void = model.pause();
        await recorderTick();
        LogicTestLog.value(name, 'recoveredVoidResult0', 'undefined', String(recovered0));
        expect(String(recovered0)).assertEqual('undefined');
        r1.recover('resume');
        const recovered1: void = model.resume();
        await recorderTick();
        LogicTestLog.value(name, 'recoveredVoidResult1', 'undefined', String(recovered1));
        expect(String(recovered1)).assertEqual('undefined');
        r1.emitState('paused');
        r1.emitState('started');
        LogicTestLog.number(name, 'realCallbacksAfterRecovery', 3, callbacks);
        expect(callbacks).assertEqual(3);
        LogicTestLog.value(name, 'descriptorAfterVoidFailures', 'fd://1403', r1.configs[0].url);
        expect(r1.configs[0].url).assertEqual('fd://1403');
        await model.finish();
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'callbacksAfterCleanup', 3, callbacks);
        expect(callbacks).assertEqual(3);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.pause.enter', 'r1.pause.reject',
          'r1.resume.enter', 'r1.resume.reject', 'r1.pause.enter', 'r1.pause.resolve',
          'r1.resume.enter', 'r1.resume.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'voidRecoveryAndCleanup', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1100
     * @tc.name VoidRejection4
     * @tc.desc Void pause and resume log promise rejections, retain their recorder, and permit later successful
     * commands.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1100';
        const input: string =
          'rejectCommands=pause/pause';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(1404);
        r1.emitState('started');
        r1.fail('pause', 'pause promise rejected 3');
        const result0: void = model.pause();
        await recorderTick();
        LogicTestLog.value(name, 'failedVoidResult0', 'undefined', String(result0));
        expect(String(result0)).assertEqual('undefined');
        LogicTestLog.number(name, 'noSyntheticCallback0', 1, callbacks);
        expect(callbacks).assertEqual(1);
        const result1: void = model.pause();
        await recorderTick();
        LogicTestLog.value(name, 'failedVoidResult1', 'undefined', String(result1));
        expect(String(result1)).assertEqual('undefined');
        LogicTestLog.number(name, 'noSyntheticCallback1', 1, callbacks);
        expect(callbacks).assertEqual(1);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.pause.enter', 'r1.pause.reject',
          'r1.pause.enter', 'r1.pause.reject'
        ];
        LogicTestLog.value(name, 'handledVoidRejections', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.recover('pause');
        const recovered0: void = model.pause();
        await recorderTick();
        LogicTestLog.value(name, 'recoveredVoidResult0', 'undefined', String(recovered0));
        expect(String(recovered0)).assertEqual('undefined');
        r1.emitState('paused');
        r1.emitState('started');
        LogicTestLog.number(name, 'realCallbacksAfterRecovery', 3, callbacks);
        expect(callbacks).assertEqual(3);
        LogicTestLog.value(name, 'descriptorAfterVoidFailures', 'fd://1404', r1.configs[0].url);
        expect(r1.configs[0].url).assertEqual('fd://1404');
        await model.finish();
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'callbacksAfterCleanup', 3, callbacks);
        expect(callbacks).assertEqual(3);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.pause.enter', 'r1.pause.reject',
          'r1.pause.enter', 'r1.pause.reject', 'r1.pause.enter', 'r1.pause.resolve',
          'r1.stop.enter', 'r1.stop.resolve', 'r1.reset.enter', 'r1.reset.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'voidRecoveryAndCleanup', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1101
     * @tc.name VoidRejection5
     * @tc.desc Void pause and resume log promise rejections, retain their recorder, and permit later successful
     * commands.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1101';
        const input: string =
          'rejectCommands=resume/pause/resume';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(1405);
        r1.emitState('started');
        r1.fail('resume', 'resume promise rejected 4');
        r1.fail('pause', 'pause promise rejected 4');
        const result0: void = model.resume();
        await recorderTick();
        LogicTestLog.value(name, 'failedVoidResult0', 'undefined', String(result0));
        expect(String(result0)).assertEqual('undefined');
        LogicTestLog.number(name, 'noSyntheticCallback0', 1, callbacks);
        expect(callbacks).assertEqual(1);
        const result1: void = model.pause();
        await recorderTick();
        LogicTestLog.value(name, 'failedVoidResult1', 'undefined', String(result1));
        expect(String(result1)).assertEqual('undefined');
        LogicTestLog.number(name, 'noSyntheticCallback1', 1, callbacks);
        expect(callbacks).assertEqual(1);
        const result2: void = model.resume();
        await recorderTick();
        LogicTestLog.value(name, 'failedVoidResult2', 'undefined', String(result2));
        expect(String(result2)).assertEqual('undefined');
        LogicTestLog.number(name, 'noSyntheticCallback2', 1, callbacks);
        expect(callbacks).assertEqual(1);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.resume.enter', 'r1.resume.reject',
          'r1.pause.enter', 'r1.pause.reject', 'r1.resume.enter', 'r1.resume.reject'
        ];
        LogicTestLog.value(name, 'handledVoidRejections', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.recover('resume');
        const recovered0: void = model.resume();
        await recorderTick();
        LogicTestLog.value(name, 'recoveredVoidResult0', 'undefined', String(recovered0));
        expect(String(recovered0)).assertEqual('undefined');
        r1.recover('pause');
        const recovered1: void = model.pause();
        await recorderTick();
        LogicTestLog.value(name, 'recoveredVoidResult1', 'undefined', String(recovered1));
        expect(String(recovered1)).assertEqual('undefined');
        r1.emitState('paused');
        r1.emitState('started');
        LogicTestLog.number(name, 'realCallbacksAfterRecovery', 3, callbacks);
        expect(callbacks).assertEqual(3);
        LogicTestLog.value(name, 'descriptorAfterVoidFailures', 'fd://1405', r1.configs[0].url);
        expect(r1.configs[0].url).assertEqual('fd://1405');
        await model.finish();
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'callbacksAfterCleanup', 3, callbacks);
        expect(callbacks).assertEqual(3);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.resume.enter', 'r1.resume.reject',
          'r1.pause.enter', 'r1.pause.reject', 'r1.resume.enter', 'r1.resume.reject',
          'r1.resume.enter', 'r1.resume.resolve', 'r1.pause.enter', 'r1.pause.resolve',
          'r1.stop.enter', 'r1.stop.resolve', 'r1.reset.enter', 'r1.reset.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'voidRecoveryAndCleanup', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1102
     * @tc.name FinishAwaitsstop
     * @tc.desc Finish detaches immediately and waits at each port boundary without handling late events.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1102';
        const input: string =
          'blockedFinishMethod=stop';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        r1.emitState('started');
        const gate: RecorderGate = new RecorderGate();
        r1.defer('stop', gate);
        let completed: boolean = false;
        const finishing: Promise<void> = model.finish().then((): void => {
          completed = true;
        });
        await recorderTick();
        LogicTestLog.flag(name, 'finishPendingExpectedFalse', completed);
        expect(completed).assertFalse();
        LogicTestLog.number(name, 'stopEntered', 1, r1.callCount('stop'));
        expect(r1.callCount('stop')).assertEqual(1);
        LogicTestLog.number(name, 'resetEnteredOnlyAfterStop', 0, r1.callCount('reset'));
        expect(r1.callCount('reset')).assertEqual(0);
        LogicTestLog.number(name, 'releaseEnteredOnlyAfterReset', 0, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError', 'r1.stop.enter'
        ];
        LogicTestLog.value(name, 'finishBlockedOrdering', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'initialCallbackRetainedOnly', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'latePreparedCannotStart', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await recorderTick();
        LogicTestLog.number(name, 'noPrepareWhileFinishing', 0, r1.configs.length);
        expect(r1.configs.length).assertEqual(0);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError', 'r1.stop.enter'
        ];
        LogicTestLog.value(name, 'detachedBeforeTeardownCompletes', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        gate.open();
        await finishing;
        LogicTestLog.flag(name, 'finishCompletedExpectedTrue', completed);
        expect(completed).assertTrue();
        LogicTestLog.number(name, 'stopExactlyOnce', 1, r1.callCount('stop'));
        expect(r1.callCount('stop')).assertEqual(1);
        LogicTestLog.number(name, 'resetExactlyOnce', 1, r1.callCount('reset'));
        expect(r1.callCount('reset')).assertEqual(1);
        LogicTestLog.number(name, 'releaseExactlyOnce', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'callbacksAfterFinish', 1, callbacks);
        expect(callbacks).assertEqual(1);
        const expectedHistory3: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.stop.enter', 'r1.stop.resolve', 'r1.reset.enter', 'r1.reset.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'finishSettledAndCleared', expectedHistory3.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory3.join('|'));
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(1501);
        r2.emitState('started');
        LogicTestLog.number(name, 'newCallbackAfterFinish', 2, callbacks);
        expect(callbacks).assertEqual(2);
        LogicTestLog.value(name, 'newDescriptor', 'fd://1501', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://1501');
        await model.finish();
        const expectedHistory4: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.stop.enter', 'r1.stop.resolve', 'r1.reset.enter', 'r1.reset.resolve',
          'r1.release.enter', 'r1.release.resolve', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r2.stop.enter', 'r2.stop.resolve', 'r2.reset.enter', 'r2.reset.resolve',
          'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory4.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory4.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1103
     * @tc.name FinishAwaitsreset
     * @tc.desc Finish detaches immediately and waits at each port boundary without handling late events.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1103';
        const input: string =
          'blockedFinishMethod=reset';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        r1.emitState('started');
        const gate: RecorderGate = new RecorderGate();
        r1.defer('reset', gate);
        let completed: boolean = false;
        const finishing: Promise<void> = model.finish().then((): void => {
          completed = true;
        });
        await recorderTick();
        LogicTestLog.flag(name, 'finishPendingExpectedFalse', completed);
        expect(completed).assertFalse();
        LogicTestLog.number(name, 'stopEntered', 1, r1.callCount('stop'));
        expect(r1.callCount('stop')).assertEqual(1);
        LogicTestLog.number(name, 'resetEnteredOnlyAfterStop', 1, r1.callCount('reset'));
        expect(r1.callCount('reset')).assertEqual(1);
        LogicTestLog.number(name, 'releaseEnteredOnlyAfterReset', 0, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.stop.enter', 'r1.stop.resolve', 'r1.reset.enter'
        ];
        LogicTestLog.value(name, 'finishBlockedOrdering', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'initialCallbackRetainedOnly', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'latePreparedCannotStart', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await recorderTick();
        LogicTestLog.number(name, 'noPrepareWhileFinishing', 0, r1.configs.length);
        expect(r1.configs.length).assertEqual(0);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.stop.enter', 'r1.stop.resolve', 'r1.reset.enter'
        ];
        LogicTestLog.value(name, 'detachedBeforeTeardownCompletes', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        gate.open();
        await finishing;
        LogicTestLog.flag(name, 'finishCompletedExpectedTrue', completed);
        expect(completed).assertTrue();
        LogicTestLog.number(name, 'stopExactlyOnce', 1, r1.callCount('stop'));
        expect(r1.callCount('stop')).assertEqual(1);
        LogicTestLog.number(name, 'resetExactlyOnce', 1, r1.callCount('reset'));
        expect(r1.callCount('reset')).assertEqual(1);
        LogicTestLog.number(name, 'releaseExactlyOnce', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'callbacksAfterFinish', 1, callbacks);
        expect(callbacks).assertEqual(1);
        const expectedHistory3: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.stop.enter', 'r1.stop.resolve', 'r1.reset.enter', 'r1.reset.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'finishSettledAndCleared', expectedHistory3.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory3.join('|'));
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(1502);
        r2.emitState('started');
        LogicTestLog.number(name, 'newCallbackAfterFinish', 2, callbacks);
        expect(callbacks).assertEqual(2);
        LogicTestLog.value(name, 'newDescriptor', 'fd://1502', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://1502');
        await model.finish();
        const expectedHistory4: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.stop.enter', 'r1.stop.resolve', 'r1.reset.enter', 'r1.reset.resolve',
          'r1.release.enter', 'r1.release.resolve', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r2.stop.enter', 'r2.stop.resolve', 'r2.reset.enter', 'r2.reset.resolve',
          'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory4.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory4.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1104
     * @tc.name FinishAwaitsrelease
     * @tc.desc Finish detaches immediately and waits at each port boundary without handling late events.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1104';
        const input: string =
          'blockedFinishMethod=release';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        r1.emitState('started');
        const gate: RecorderGate = new RecorderGate();
        r1.defer('release', gate);
        let completed: boolean = false;
        const finishing: Promise<void> = model.finish().then((): void => {
          completed = true;
        });
        await recorderTick();
        LogicTestLog.flag(name, 'finishPendingExpectedFalse', completed);
        expect(completed).assertFalse();
        LogicTestLog.number(name, 'stopEntered', 1, r1.callCount('stop'));
        expect(r1.callCount('stop')).assertEqual(1);
        LogicTestLog.number(name, 'resetEnteredOnlyAfterStop', 1, r1.callCount('reset'));
        expect(r1.callCount('reset')).assertEqual(1);
        LogicTestLog.number(name, 'releaseEnteredOnlyAfterReset', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.stop.enter', 'r1.stop.resolve', 'r1.reset.enter', 'r1.reset.resolve',
          'r1.release.enter'
        ];
        LogicTestLog.value(name, 'finishBlockedOrdering', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await recorderTick();
        LogicTestLog.number(name, 'initialCallbackRetainedOnly', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'latePreparedCannotStart', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await recorderTick();
        LogicTestLog.number(name, 'noPrepareWhileFinishing', 0, r1.configs.length);
        expect(r1.configs.length).assertEqual(0);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.stop.enter', 'r1.stop.resolve', 'r1.reset.enter', 'r1.reset.resolve',
          'r1.release.enter'
        ];
        LogicTestLog.value(name, 'detachedBeforeTeardownCompletes', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        gate.open();
        await finishing;
        LogicTestLog.flag(name, 'finishCompletedExpectedTrue', completed);
        expect(completed).assertTrue();
        LogicTestLog.number(name, 'stopExactlyOnce', 1, r1.callCount('stop'));
        expect(r1.callCount('stop')).assertEqual(1);
        LogicTestLog.number(name, 'resetExactlyOnce', 1, r1.callCount('reset'));
        expect(r1.callCount('reset')).assertEqual(1);
        LogicTestLog.number(name, 'releaseExactlyOnce', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'callbacksAfterFinish', 1, callbacks);
        expect(callbacks).assertEqual(1);
        const expectedHistory3: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.stop.enter', 'r1.stop.resolve', 'r1.reset.enter', 'r1.reset.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'finishSettledAndCleared', expectedHistory3.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory3.join('|'));
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(1503);
        r2.emitState('started');
        LogicTestLog.number(name, 'newCallbackAfterFinish', 2, callbacks);
        expect(callbacks).assertEqual(2);
        LogicTestLog.value(name, 'newDescriptor', 'fd://1503', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://1503');
        await model.finish();
        const expectedHistory4: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.stop.enter', 'r1.stop.resolve', 'r1.reset.enter', 'r1.reset.resolve',
          'r1.release.enter', 'r1.release.resolve', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r2.stop.enter', 'r2.stop.resolve', 'r2.reset.enter', 'r2.reset.resolve',
          'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory4.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory4.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1105
     * @tc.name FactoryBlockedThenrelease
     * @tc.desc Disposal invalidates a blocked factory; its resolved handle is released without installation or
     * preparation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1105';
        const input: string =
          'factory1=blocked; dispose=release; retry=success';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        const gate: RecorderGate = new RecorderGate();
        factory.defer(1, gate);
        const initializing: Promise<string> = recorderRejection((): Promise<void> =>
          model.initAudioRecorder((): void => { callbacks++; }));
        await recorderTick();
        LogicTestLog.number(name, 'blockedFactoryEntered', 1, factory.calls);
        expect(factory.calls).assertEqual(1);
        const expectedHistory1: string[] = [
          'factory.1.enter'
        ];
        LogicTestLog.value(name, 'factoryStillBlocked', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        const disposalError: string = await recorderRejection((): Promise<void> => model.release());
        LogicTestLog.value(name, 'disposalWithoutHandleError', '', disposalError);
        expect(disposalError).assertEqual('');
        r1.emitState('prepared');
        r1.emitState('started');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await recorderTick();
        LogicTestLog.number(name, 'noBlockedCallback', 0, callbacks);
        expect(callbacks).assertEqual(0);
        LogicTestLog.number(name, 'noBlockedPrepare', 0, r1.configs.length);
        expect(r1.configs.length).assertEqual(0);
        LogicTestLog.number(name, 'noBlockedStart', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'unresolvedHandleNotReleased', 0, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(0);
        gate.open();
        const initError: string = await initializing;
        LogicTestLog.value(name, 'invalidatedInitError', '', initError);
        expect(initError).assertEqual('');
        r1.emitState('prepared');
        r1.emitState('paused');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await recorderTick();
        LogicTestLog.number(name, 'staleResolvedReleaseOnce', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        LogicTestLog.number(name, 'staleResolvedNoStop', 0, r1.callCount('stop'));
        expect(r1.callCount('stop')).assertEqual(0);
        LogicTestLog.number(name, 'staleResolvedNoReset', 0, r1.callCount('reset'));
        expect(r1.callCount('reset')).assertEqual(0);
        LogicTestLog.number(name, 'staleResolvedNoCallback', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'staleHandleNeverRegistered', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        LogicTestLog.number(name, 'factoryCountAfterReplacement', 2, factory.calls);
        expect(factory.calls).assertEqual(2);
        await model.startRecorder(1601);
        r2.emitState('prepared');
        await recorderTick();
        r2.emitState('started');
        r1.emitState('prepared');
        r1.emitState('started');
        LogicTestLog.number(name, 'latestCallbacksOnly', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'oldNeverPrepared', 0, r1.configs.length);
        expect(r1.configs.length).assertEqual(0);
        LogicTestLog.number(name, 'oldNeverStarted', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'latestPreparedOnce', 1, r2.configs.length);
        expect(r2.configs.length).assertEqual(1);
        LogicTestLog.number(name, 'latestStartedOnce', 1, r2.callCount('start'));
        expect(r2.callCount('start')).assertEqual(1);
        LogicTestLog.value(name, 'latestDescriptor', 'fd://1601', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://1601');
        await model.finish();
        r2.emitState('prepared');
        r2.emitState('paused');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'latestStopOnce', 1, r2.callCount('stop'));
        expect(r2.callCount('stop')).assertEqual(1);
        LogicTestLog.number(name, 'latestResetOnce', 1, r2.callCount('reset'));
        expect(r2.callCount('reset')).assertEqual(1);
        LogicTestLog.number(name, 'latestReleaseOnce', 1, r2.callCount('release'));
        expect(r2.callCount('release')).assertEqual(1);
        LogicTestLog.number(name, 'latestCallbacksAfterFinish', 1, callbacks);
        expect(callbacks).assertEqual(1);
        const expectedHistory3: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.release.enter', 'r1.release.resolve',
          'factory.2.enter', 'factory.2.resolve', 'r2.onStateChange', 'r2.onError',
          'r2.prepare.enter', 'r2.prepare.resolve', 'r2.start.enter', 'r2.start.resolve',
          'r2.stop.enter', 'r2.stop.resolve', 'r2.reset.enter', 'r2.reset.resolve',
          'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory3.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory3.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1106
     * @tc.name FactoryBlockedThenfinish
     * @tc.desc Disposal invalidates a blocked factory; its resolved handle is released without installation or
     * preparation.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1106';
        const input: string =
          'factory1=blocked; dispose=finish; retry=success';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        const gate: RecorderGate = new RecorderGate();
        factory.defer(1, gate);
        const initializing: Promise<string> = recorderRejection((): Promise<void> =>
          model.initAudioRecorder((): void => { callbacks++; }));
        await recorderTick();
        LogicTestLog.number(name, 'blockedFactoryEntered', 1, factory.calls);
        expect(factory.calls).assertEqual(1);
        const expectedHistory1: string[] = [
          'factory.1.enter'
        ];
        LogicTestLog.value(name, 'factoryStillBlocked', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        const disposalError: string = await recorderRejection((): Promise<void> => model.finish());
        LogicTestLog.value(name, 'disposalWithoutHandleError', '', disposalError);
        expect(disposalError).assertEqual('');
        r1.emitState('prepared');
        r1.emitState('started');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await recorderTick();
        LogicTestLog.number(name, 'noBlockedCallback', 0, callbacks);
        expect(callbacks).assertEqual(0);
        LogicTestLog.number(name, 'noBlockedPrepare', 0, r1.configs.length);
        expect(r1.configs.length).assertEqual(0);
        LogicTestLog.number(name, 'noBlockedStart', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'unresolvedHandleNotReleased', 0, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(0);
        gate.open();
        const initError: string = await initializing;
        LogicTestLog.value(name, 'invalidatedInitError', '', initError);
        expect(initError).assertEqual('');
        r1.emitState('prepared');
        r1.emitState('paused');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await recorderTick();
        LogicTestLog.number(name, 'staleResolvedReleaseOnce', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        LogicTestLog.number(name, 'staleResolvedNoStop', 0, r1.callCount('stop'));
        expect(r1.callCount('stop')).assertEqual(0);
        LogicTestLog.number(name, 'staleResolvedNoReset', 0, r1.callCount('reset'));
        expect(r1.callCount('reset')).assertEqual(0);
        LogicTestLog.number(name, 'staleResolvedNoCallback', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'staleHandleNeverRegistered', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        LogicTestLog.number(name, 'factoryCountAfterReplacement', 2, factory.calls);
        expect(factory.calls).assertEqual(2);
        await model.startRecorder(1602);
        r2.emitState('prepared');
        await recorderTick();
        r2.emitState('started');
        r1.emitState('prepared');
        r1.emitState('started');
        LogicTestLog.number(name, 'latestCallbacksOnly', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'oldNeverPrepared', 0, r1.configs.length);
        expect(r1.configs.length).assertEqual(0);
        LogicTestLog.number(name, 'oldNeverStarted', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'latestPreparedOnce', 1, r2.configs.length);
        expect(r2.configs.length).assertEqual(1);
        LogicTestLog.number(name, 'latestStartedOnce', 1, r2.callCount('start'));
        expect(r2.callCount('start')).assertEqual(1);
        LogicTestLog.value(name, 'latestDescriptor', 'fd://1602', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://1602');
        await model.finish();
        r2.emitState('prepared');
        r2.emitState('paused');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'latestStopOnce', 1, r2.callCount('stop'));
        expect(r2.callCount('stop')).assertEqual(1);
        LogicTestLog.number(name, 'latestResetOnce', 1, r2.callCount('reset'));
        expect(r2.callCount('reset')).assertEqual(1);
        LogicTestLog.number(name, 'latestReleaseOnce', 1, r2.callCount('release'));
        expect(r2.callCount('release')).assertEqual(1);
        LogicTestLog.number(name, 'latestCallbacksAfterFinish', 1, callbacks);
        expect(callbacks).assertEqual(1);
        const expectedHistory3: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.release.enter', 'r1.release.resolve',
          'factory.2.enter', 'factory.2.resolve', 'r2.onStateChange', 'r2.onError',
          'r2.prepare.enter', 'r2.prepare.resolve', 'r2.start.enter', 'r2.start.resolve',
          'r2.stop.enter', 'r2.stop.resolve', 'r2.reset.enter', 'r2.reset.resolve',
          'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory3.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory3.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1107
     * @tc.name OverlappingInitReverseResolution
     * @tc.desc Reverse factory completion cannot replace the newest recorder or attach callbacks to the stale
     * result.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1107';
        const input: string =
          'factory1=blocked; factory2=resolvesFirst';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        const gate: RecorderGate = new RecorderGate();
        factory.defer(1, gate);
        const firstInit: Promise<string> = recorderRejection((): Promise<void> =>
          model.initAudioRecorder((): void => { callbacks++; }));
        await recorderTick();
        LogicTestLog.number(name, 'firstFactoryPending', 1, factory.calls);
        expect(factory.calls).assertEqual(1);
        let newestCallbacks: number = 0;
        await model.initAudioRecorder((): void => {
          newestCallbacks++;
        });
        LogicTestLog.number(name, 'newestFactoryInstalledFirst', 2, factory.calls);
        expect(factory.calls).assertEqual(2);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.2.enter', 'factory.2.resolve', 'r2.onStateChange',
          'r2.onError'
        ];
        LogicTestLog.value(name, 'reverseResolutionBeforeOldFactory', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        gate.open();
        const firstError: string = await firstInit;
        LogicTestLog.value(name, 'staleInitError', '', firstError);
        expect(firstError).assertEqual('');
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        LogicTestLog.number(name, 'staleClosureNotCalled', 0, callbacks);
        expect(callbacks).assertEqual(0);
        LogicTestLog.number(name, 'staleReleasedExactlyOnce', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        LogicTestLog.number(name, 'newestNotReleasedByOldInit', 0, r2.callCount('release'));
        expect(r2.callCount('release')).assertEqual(0);
        LogicTestLog.number(name, 'factoryCountAfterReplacement', 2, factory.calls);
        expect(factory.calls).assertEqual(2);
        await model.startRecorder(1603);
        r2.emitState('prepared');
        await recorderTick();
        r2.emitState('started');
        r1.emitState('prepared');
        r1.emitState('started');
        LogicTestLog.number(name, 'latestCallbacksOnly', 1, newestCallbacks);
        expect(newestCallbacks).assertEqual(1);
        LogicTestLog.number(name, 'oldNeverPrepared', 0, r1.configs.length);
        expect(r1.configs.length).assertEqual(0);
        LogicTestLog.number(name, 'oldNeverStarted', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'latestPreparedOnce', 1, r2.configs.length);
        expect(r2.configs.length).assertEqual(1);
        LogicTestLog.number(name, 'latestStartedOnce', 1, r2.callCount('start'));
        expect(r2.callCount('start')).assertEqual(1);
        LogicTestLog.value(name, 'latestDescriptor', 'fd://1603', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://1603');
        await model.finish();
        r2.emitState('prepared');
        r2.emitState('paused');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'latestStopOnce', 1, r2.callCount('stop'));
        expect(r2.callCount('stop')).assertEqual(1);
        LogicTestLog.number(name, 'latestResetOnce', 1, r2.callCount('reset'));
        expect(r2.callCount('reset')).assertEqual(1);
        LogicTestLog.number(name, 'latestReleaseOnce', 1, r2.callCount('release'));
        expect(r2.callCount('release')).assertEqual(1);
        LogicTestLog.number(name, 'latestCallbacksAfterFinish', 1, newestCallbacks);
        expect(newestCallbacks).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.2.enter', 'factory.2.resolve', 'r2.onStateChange',
          'r2.onError', 'factory.1.resolve', 'r1.release.enter', 'r1.release.resolve',
          'r2.prepare.enter', 'r2.prepare.resolve', 'r2.start.enter', 'r2.start.resolve',
          'r2.stop.enter', 'r2.stop.resolve', 'r2.reset.enter', 'r2.reset.resolve',
          'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.number(name, 'staleClosureStillZero', 0, callbacks);
        expect(callbacks).assertEqual(0);
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1108
     * @tc.name DoubleFinishSharesstop
     * @tc.desc Overlapping finishes and initialization share one teardown and factory creation waits for its
     * settlement.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1108';
        const input: string =
          'finish1=stop/blocked; finish2=overlap; init=overlap';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        r1.emitState('started');
        const gate: RecorderGate = new RecorderGate();
        r1.defer('stop', gate);
        let firstDone: boolean = false;
        let secondDone: boolean = false;
        let replacementDone: boolean = false;
        const firstFinish: Promise<void> = model.finish().then((): void => { firstDone = true; });
        await recorderTick();
        const secondFinish: Promise<void> = model.finish().then((): void => { secondDone = true; });
        const replacing: Promise<void> = model.initAudioRecorder((): void => { callbacks++; })
          .then((): void => { replacementDone = true; });
        await recorderTick();
        LogicTestLog.flag(name, 'firstFinishPending', firstDone);
        expect(firstDone).assertFalse();
        LogicTestLog.flag(name, 'secondFinishSharesPendingWork', secondDone);
        expect(secondDone).assertFalse();
        LogicTestLog.flag(name, 'replacementWaitsForFinish', replacementDone);
        expect(replacementDone).assertFalse();
        LogicTestLog.number(name, 'noEarlyReplacementFactory', 1, factory.calls);
        expect(factory.calls).assertEqual(1);
        LogicTestLog.number(name, 'oneStopWhileBlocked', 1, r1.callCount('stop'));
        expect(r1.callCount('stop')).assertEqual(1);
        LogicTestLog.number(name, 'resetOnlyAfterStop', 0, r1.callCount('reset'));
        expect(r1.callCount('reset')).assertEqual(0);
        LogicTestLog.number(name, 'releaseOnlyAfterReset', 0, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(0);
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await recorderTick();
        LogicTestLog.number(name, 'oldCallbackDetached', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'latePreparedNotStarted', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError', 'r1.stop.enter'
        ];
        LogicTestLog.value(name, 'sharedPendingTeardown', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        gate.open();
        await Promise.all([firstFinish, secondFinish, replacing]);
        LogicTestLog.flag(name, 'firstFinishCompleted', firstDone);
        expect(firstDone).assertTrue();
        LogicTestLog.flag(name, 'secondFinishCompleted', secondDone);
        expect(secondDone).assertTrue();
        LogicTestLog.flag(name, 'replacementCompleted', replacementDone);
        expect(replacementDone).assertTrue();
        LogicTestLog.number(name, 'oldStopOnce', 1, r1.callCount('stop'));
        expect(r1.callCount('stop')).assertEqual(1);
        LogicTestLog.number(name, 'oldResetOnce', 1, r1.callCount('reset'));
        expect(r1.callCount('reset')).assertEqual(1);
        LogicTestLog.number(name, 'oldReleaseOnce', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        LogicTestLog.number(name, 'factoryCountAfterReplacement', 2, factory.calls);
        expect(factory.calls).assertEqual(2);
        await model.startRecorder(1604);
        r2.emitState('prepared');
        await recorderTick();
        r2.emitState('started');
        r1.emitState('prepared');
        r1.emitState('started');
        LogicTestLog.number(name, 'latestCallbacksOnly', 2, callbacks);
        expect(callbacks).assertEqual(2);
        LogicTestLog.number(name, 'oldNeverPrepared', 0, r1.configs.length);
        expect(r1.configs.length).assertEqual(0);
        LogicTestLog.number(name, 'oldNeverStarted', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'latestPreparedOnce', 1, r2.configs.length);
        expect(r2.configs.length).assertEqual(1);
        LogicTestLog.number(name, 'latestStartedOnce', 1, r2.callCount('start'));
        expect(r2.callCount('start')).assertEqual(1);
        LogicTestLog.value(name, 'latestDescriptor', 'fd://1604', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://1604');
        await model.finish();
        r2.emitState('prepared');
        r2.emitState('paused');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'latestStopOnce', 1, r2.callCount('stop'));
        expect(r2.callCount('stop')).assertEqual(1);
        LogicTestLog.number(name, 'latestResetOnce', 1, r2.callCount('reset'));
        expect(r2.callCount('reset')).assertEqual(1);
        LogicTestLog.number(name, 'latestReleaseOnce', 1, r2.callCount('release'));
        expect(r2.callCount('release')).assertEqual(1);
        LogicTestLog.number(name, 'latestCallbacksAfterFinish', 2, callbacks);
        expect(callbacks).assertEqual(2);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.stop.enter', 'r1.stop.resolve', 'r1.reset.enter', 'r1.reset.resolve',
          'r1.release.enter', 'r1.release.resolve', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r2.start.enter', 'r2.start.resolve', 'r2.stop.enter', 'r2.stop.resolve',
          'r2.reset.enter', 'r2.reset.resolve', 'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1109
     * @tc.name DoubleFinishSharesreset
     * @tc.desc Overlapping finishes and initialization share one teardown and factory creation waits for its
     * settlement.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1109';
        const input: string =
          'finish1=reset/blocked; finish2=overlap; init=overlap';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        r1.emitState('started');
        const gate: RecorderGate = new RecorderGate();
        r1.defer('reset', gate);
        let firstDone: boolean = false;
        let secondDone: boolean = false;
        let replacementDone: boolean = false;
        const firstFinish: Promise<void> = model.finish().then((): void => { firstDone = true; });
        await recorderTick();
        const secondFinish: Promise<void> = model.finish().then((): void => { secondDone = true; });
        const replacing: Promise<void> = model.initAudioRecorder((): void => { callbacks++; })
          .then((): void => { replacementDone = true; });
        await recorderTick();
        LogicTestLog.flag(name, 'firstFinishPending', firstDone);
        expect(firstDone).assertFalse();
        LogicTestLog.flag(name, 'secondFinishSharesPendingWork', secondDone);
        expect(secondDone).assertFalse();
        LogicTestLog.flag(name, 'replacementWaitsForFinish', replacementDone);
        expect(replacementDone).assertFalse();
        LogicTestLog.number(name, 'noEarlyReplacementFactory', 1, factory.calls);
        expect(factory.calls).assertEqual(1);
        LogicTestLog.number(name, 'oneStopWhileBlocked', 1, r1.callCount('stop'));
        expect(r1.callCount('stop')).assertEqual(1);
        LogicTestLog.number(name, 'resetOnlyAfterStop', 1, r1.callCount('reset'));
        expect(r1.callCount('reset')).assertEqual(1);
        LogicTestLog.number(name, 'releaseOnlyAfterReset', 0, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(0);
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await recorderTick();
        LogicTestLog.number(name, 'oldCallbackDetached', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'latePreparedNotStarted', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.stop.enter', 'r1.stop.resolve', 'r1.reset.enter'
        ];
        LogicTestLog.value(name, 'sharedPendingTeardown', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        gate.open();
        await Promise.all([firstFinish, secondFinish, replacing]);
        LogicTestLog.flag(name, 'firstFinishCompleted', firstDone);
        expect(firstDone).assertTrue();
        LogicTestLog.flag(name, 'secondFinishCompleted', secondDone);
        expect(secondDone).assertTrue();
        LogicTestLog.flag(name, 'replacementCompleted', replacementDone);
        expect(replacementDone).assertTrue();
        LogicTestLog.number(name, 'oldStopOnce', 1, r1.callCount('stop'));
        expect(r1.callCount('stop')).assertEqual(1);
        LogicTestLog.number(name, 'oldResetOnce', 1, r1.callCount('reset'));
        expect(r1.callCount('reset')).assertEqual(1);
        LogicTestLog.number(name, 'oldReleaseOnce', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        LogicTestLog.number(name, 'factoryCountAfterReplacement', 2, factory.calls);
        expect(factory.calls).assertEqual(2);
        await model.startRecorder(1605);
        r2.emitState('prepared');
        await recorderTick();
        r2.emitState('started');
        r1.emitState('prepared');
        r1.emitState('started');
        LogicTestLog.number(name, 'latestCallbacksOnly', 2, callbacks);
        expect(callbacks).assertEqual(2);
        LogicTestLog.number(name, 'oldNeverPrepared', 0, r1.configs.length);
        expect(r1.configs.length).assertEqual(0);
        LogicTestLog.number(name, 'oldNeverStarted', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'latestPreparedOnce', 1, r2.configs.length);
        expect(r2.configs.length).assertEqual(1);
        LogicTestLog.number(name, 'latestStartedOnce', 1, r2.callCount('start'));
        expect(r2.callCount('start')).assertEqual(1);
        LogicTestLog.value(name, 'latestDescriptor', 'fd://1605', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://1605');
        await model.finish();
        r2.emitState('prepared');
        r2.emitState('paused');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'latestStopOnce', 1, r2.callCount('stop'));
        expect(r2.callCount('stop')).assertEqual(1);
        LogicTestLog.number(name, 'latestResetOnce', 1, r2.callCount('reset'));
        expect(r2.callCount('reset')).assertEqual(1);
        LogicTestLog.number(name, 'latestReleaseOnce', 1, r2.callCount('release'));
        expect(r2.callCount('release')).assertEqual(1);
        LogicTestLog.number(name, 'latestCallbacksAfterFinish', 2, callbacks);
        expect(callbacks).assertEqual(2);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.stop.enter', 'r1.stop.resolve', 'r1.reset.enter', 'r1.reset.resolve',
          'r1.release.enter', 'r1.release.resolve', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r2.start.enter', 'r2.start.resolve', 'r2.stop.enter', 'r2.stop.resolve',
          'r2.reset.enter', 'r2.reset.resolve', 'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1110
     * @tc.name DoubleFinishSharesrelease
     * @tc.desc Overlapping finishes and initialization share one teardown and factory creation waits for its
     * settlement.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1110';
        const input: string =
          'finish1=release/blocked; finish2=overlap; init=overlap';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        r1.emitState('started');
        const gate: RecorderGate = new RecorderGate();
        r1.defer('release', gate);
        let firstDone: boolean = false;
        let secondDone: boolean = false;
        let replacementDone: boolean = false;
        const firstFinish: Promise<void> = model.finish().then((): void => { firstDone = true; });
        await recorderTick();
        const secondFinish: Promise<void> = model.finish().then((): void => { secondDone = true; });
        const replacing: Promise<void> = model.initAudioRecorder((): void => { callbacks++; })
          .then((): void => { replacementDone = true; });
        await recorderTick();
        LogicTestLog.flag(name, 'firstFinishPending', firstDone);
        expect(firstDone).assertFalse();
        LogicTestLog.flag(name, 'secondFinishSharesPendingWork', secondDone);
        expect(secondDone).assertFalse();
        LogicTestLog.flag(name, 'replacementWaitsForFinish', replacementDone);
        expect(replacementDone).assertFalse();
        LogicTestLog.number(name, 'noEarlyReplacementFactory', 1, factory.calls);
        expect(factory.calls).assertEqual(1);
        LogicTestLog.number(name, 'oneStopWhileBlocked', 1, r1.callCount('stop'));
        expect(r1.callCount('stop')).assertEqual(1);
        LogicTestLog.number(name, 'resetOnlyAfterStop', 1, r1.callCount('reset'));
        expect(r1.callCount('reset')).assertEqual(1);
        LogicTestLog.number(name, 'releaseOnlyAfterReset', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await recorderTick();
        LogicTestLog.number(name, 'oldCallbackDetached', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'latePreparedNotStarted', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.stop.enter', 'r1.stop.resolve', 'r1.reset.enter', 'r1.reset.resolve',
          'r1.release.enter'
        ];
        LogicTestLog.value(name, 'sharedPendingTeardown', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        gate.open();
        await Promise.all([firstFinish, secondFinish, replacing]);
        LogicTestLog.flag(name, 'firstFinishCompleted', firstDone);
        expect(firstDone).assertTrue();
        LogicTestLog.flag(name, 'secondFinishCompleted', secondDone);
        expect(secondDone).assertTrue();
        LogicTestLog.flag(name, 'replacementCompleted', replacementDone);
        expect(replacementDone).assertTrue();
        LogicTestLog.number(name, 'oldStopOnce', 1, r1.callCount('stop'));
        expect(r1.callCount('stop')).assertEqual(1);
        LogicTestLog.number(name, 'oldResetOnce', 1, r1.callCount('reset'));
        expect(r1.callCount('reset')).assertEqual(1);
        LogicTestLog.number(name, 'oldReleaseOnce', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        LogicTestLog.number(name, 'factoryCountAfterReplacement', 2, factory.calls);
        expect(factory.calls).assertEqual(2);
        await model.startRecorder(1606);
        r2.emitState('prepared');
        await recorderTick();
        r2.emitState('started');
        r1.emitState('prepared');
        r1.emitState('started');
        LogicTestLog.number(name, 'latestCallbacksOnly', 2, callbacks);
        expect(callbacks).assertEqual(2);
        LogicTestLog.number(name, 'oldNeverPrepared', 0, r1.configs.length);
        expect(r1.configs.length).assertEqual(0);
        LogicTestLog.number(name, 'oldNeverStarted', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'latestPreparedOnce', 1, r2.configs.length);
        expect(r2.configs.length).assertEqual(1);
        LogicTestLog.number(name, 'latestStartedOnce', 1, r2.callCount('start'));
        expect(r2.callCount('start')).assertEqual(1);
        LogicTestLog.value(name, 'latestDescriptor', 'fd://1606', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://1606');
        await model.finish();
        r2.emitState('prepared');
        r2.emitState('paused');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'latestStopOnce', 1, r2.callCount('stop'));
        expect(r2.callCount('stop')).assertEqual(1);
        LogicTestLog.number(name, 'latestResetOnce', 1, r2.callCount('reset'));
        expect(r2.callCount('reset')).assertEqual(1);
        LogicTestLog.number(name, 'latestReleaseOnce', 1, r2.callCount('release'));
        expect(r2.callCount('release')).assertEqual(1);
        LogicTestLog.number(name, 'latestCallbacksAfterFinish', 2, callbacks);
        expect(callbacks).assertEqual(2);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.stop.enter', 'r1.stop.resolve', 'r1.reset.enter', 'r1.reset.resolve',
          'r1.release.enter', 'r1.release.resolve', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r2.start.enter', 'r2.start.resolve', 'r2.stop.enter', 'r2.stop.resolve',
          'r2.reset.enter', 'r2.reset.resolve', 'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1111
     * @tc.name ReleaseSharesRejectedFinish
     * @tc.desc Release joins a blocked finish, observes the same final release error, and settled failure permits
     * retry.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1111';
        const input: string =
          'stop=blocked/rejected; release=rejected; retry=success';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        r1.emitState('started');
        const gate: RecorderGate = new RecorderGate();
        r1.defer('stop', gate);
        r1.fail('stop', 'Shared stop fault');
        r1.fail('release', 'Shared final release fault');
        let releaseDone: boolean = false;
        const finishing: Promise<string> = recorderRejection((): Promise<void> => model.finish());
        await recorderTick();
        const releasing: Promise<string> =
          recorderRejection((): Promise<void> => model.release()).then((error: string): string => {
            releaseDone = true;
            return error;
          });
        await recorderTick();
        LogicTestLog.flag(name, 'overlappingReleaseMustWait', releaseDone);
        expect(releaseDone).assertFalse();
        LogicTestLog.number(name, 'singlePendingStop', 1, r1.callCount('stop'));
        expect(r1.callCount('stop')).assertEqual(1);
        LogicTestLog.number(name, 'releaseNotStartedBeforeStop', 0, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(0);
        r1.emitState('prepared');
        r1.emitState('paused');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await recorderTick();
        LogicTestLog.number(name, 'callbacksDetachedDuringFailure', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'latePreparedIgnoredDuringFailure', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError', 'r1.stop.enter'
        ];
        LogicTestLog.value(name, 'sharedFailurePending', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        gate.open();
        const finishError: string = await finishing;
        const releaseError: string = await releasing;
        LogicTestLog.value(name, 'finishFinalError', 'Shared final release fault', finishError);
        expect(finishError).assertEqual('Shared final release fault');
        LogicTestLog.value(name, 'overlappingReleaseSameError', 'Shared final release fault', releaseError);
        expect(releaseError).assertEqual('Shared final release fault');
        LogicTestLog.flag(name, 'releaseSettledAfterFinish', releaseDone);
        expect(releaseDone).assertTrue();
        LogicTestLog.number(name, 'stopRejectedOnce', 1, r1.callCount('stop'));
        expect(r1.callCount('stop')).assertEqual(1);
        LogicTestLog.number(name, 'resetSkippedAfterStopFailure', 0, r1.callCount('reset'));
        expect(r1.callCount('reset')).assertEqual(0);
        LogicTestLog.number(name, 'releaseStillAttemptedOnce', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.stop.enter', 'r1.stop.reject', 'r1.release.enter', 'r1.release.reject'
        ];
        LogicTestLog.value(name, 'sharedFailureSettled', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        LogicTestLog.number(name, 'factoryCountAfterReplacement', 2, factory.calls);
        expect(factory.calls).assertEqual(2);
        await model.startRecorder(1607);
        r2.emitState('prepared');
        await recorderTick();
        r2.emitState('started');
        r1.emitState('prepared');
        r1.emitState('started');
        LogicTestLog.number(name, 'latestCallbacksOnly', 2, callbacks);
        expect(callbacks).assertEqual(2);
        LogicTestLog.number(name, 'oldNeverPrepared', 0, r1.configs.length);
        expect(r1.configs.length).assertEqual(0);
        LogicTestLog.number(name, 'oldNeverStarted', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'latestPreparedOnce', 1, r2.configs.length);
        expect(r2.configs.length).assertEqual(1);
        LogicTestLog.number(name, 'latestStartedOnce', 1, r2.callCount('start'));
        expect(r2.callCount('start')).assertEqual(1);
        LogicTestLog.value(name, 'latestDescriptor', 'fd://1607', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://1607');
        await model.finish();
        r2.emitState('prepared');
        r2.emitState('paused');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'latestStopOnce', 1, r2.callCount('stop'));
        expect(r2.callCount('stop')).assertEqual(1);
        LogicTestLog.number(name, 'latestResetOnce', 1, r2.callCount('reset'));
        expect(r2.callCount('reset')).assertEqual(1);
        LogicTestLog.number(name, 'latestReleaseOnce', 1, r2.callCount('release'));
        expect(r2.callCount('release')).assertEqual(1);
        LogicTestLog.number(name, 'latestCallbacksAfterFinish', 2, callbacks);
        expect(callbacks).assertEqual(2);
        const expectedHistory3: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.stop.enter', 'r1.stop.reject', 'r1.release.enter', 'r1.release.reject',
          'factory.2.enter', 'factory.2.resolve', 'r2.onStateChange', 'r2.onError',
          'r2.prepare.enter', 'r2.prepare.resolve', 'r2.start.enter', 'r2.start.resolve',
          'r2.stop.enter', 'r2.stop.resolve', 'r2.reset.enter', 'r2.reset.resolve',
          'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory3.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory3.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1112
     * @tc.name ExternalReleasePendingThenReinit
     * @tc.desc Initialization waits for an already detached external release without releasing that handle twice.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1112';
        const input: string =
          'externalRelease=blocked; reinit=waits';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        r1.emitState('started');
        const gate: RecorderGate = new RecorderGate();
        r1.defer('release', gate);
        let releaseDone: boolean = false;
        let initDone: boolean = false;
        const releasing: Promise<void> = model.release().then((): void => { releaseDone = true; });
        await recorderTick();
        const replacing: Promise<void> = model.initAudioRecorder((): void => { callbacks++; })
          .then((): void => { initDone = true; });
        await recorderTick();
        LogicTestLog.flag(name, 'externalReleaseStillPending', releaseDone);
        expect(releaseDone).assertFalse();
        LogicTestLog.flag(name, 'reinitWaitsForExternalRelease', initDone);
        expect(initDone).assertFalse();
        LogicTestLog.number(name, 'factoryNotInvokedDuringExternalRelease', 1, factory.calls);
        expect(factory.calls).assertEqual(1);
        LogicTestLog.number(name, 'externalReleaseNotDuplicated', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        LogicTestLog.number(name, 'externalReleaseDoesNotStop', 0, r1.callCount('stop'));
        expect(r1.callCount('stop')).assertEqual(0);
        LogicTestLog.number(name, 'externalReleaseDoesNotReset', 0, r1.callCount('reset'));
        expect(r1.callCount('reset')).assertEqual(0);
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await recorderTick();
        LogicTestLog.number(name, 'externalReleaseDetachedCallback', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'externalReleaseNoLateStart', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter'
        ];
        LogicTestLog.value(name, 'externalReleasePending', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        gate.open();
        await Promise.all([releasing, replacing]);
        LogicTestLog.flag(name, 'externalReleaseCompleted', releaseDone);
        expect(releaseDone).assertTrue();
        LogicTestLog.flag(name, 'reinitCompletedAfterRelease', initDone);
        expect(initDone).assertTrue();
        LogicTestLog.number(name, 'externalReleaseExactlyOnce', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        LogicTestLog.number(name, 'factoryCountAfterReplacement', 2, factory.calls);
        expect(factory.calls).assertEqual(2);
        await model.startRecorder(1608);
        r2.emitState('prepared');
        await recorderTick();
        r2.emitState('started');
        r1.emitState('prepared');
        r1.emitState('started');
        LogicTestLog.number(name, 'latestCallbacksOnly', 2, callbacks);
        expect(callbacks).assertEqual(2);
        LogicTestLog.number(name, 'oldNeverPrepared', 0, r1.configs.length);
        expect(r1.configs.length).assertEqual(0);
        LogicTestLog.number(name, 'oldNeverStarted', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'latestPreparedOnce', 1, r2.configs.length);
        expect(r2.configs.length).assertEqual(1);
        LogicTestLog.number(name, 'latestStartedOnce', 1, r2.callCount('start'));
        expect(r2.callCount('start')).assertEqual(1);
        LogicTestLog.value(name, 'latestDescriptor', 'fd://1608', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://1608');
        await model.finish();
        r2.emitState('prepared');
        r2.emitState('paused');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'latestStopOnce', 1, r2.callCount('stop'));
        expect(r2.callCount('stop')).assertEqual(1);
        LogicTestLog.number(name, 'latestResetOnce', 1, r2.callCount('reset'));
        expect(r2.callCount('reset')).assertEqual(1);
        LogicTestLog.number(name, 'latestReleaseOnce', 1, r2.callCount('release'));
        expect(r2.callCount('release')).assertEqual(1);
        LogicTestLog.number(name, 'latestCallbacksAfterFinish', 2, callbacks);
        expect(callbacks).assertEqual(2);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r2.start.enter', 'r2.start.resolve', 'r2.stop.enter', 'r2.stop.resolve',
          'r2.reset.enter', 'r2.reset.resolve', 'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1113
     * @tc.name DisposeWhileReplacingrelease
     * @tc.desc Disposal invalidates reinitialization waiting on cleanup before it can invoke the replacement
     * factory.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1113';
        const input: string =
          'oldRelease=blocked; dispose=release; retry=success';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        r1.emitState('started');
        const gate: RecorderGate = new RecorderGate();
        r1.defer('release', gate);
        let disposalDone: boolean = false;
        const replacing: Promise<string> = recorderRejection((): Promise<void> =>
          model.initAudioRecorder((): void => { callbacks++; }));
        await recorderTick();
        const disposing: Promise<string> = recorderRejection((): Promise<void> => model.release())
          .then((error: string): string => { disposalDone = true; return error; });
        await recorderTick();
        LogicTestLog.flag(name, 'disposalSharesReplacementCleanup', disposalDone);
        expect(disposalDone).assertFalse();
        LogicTestLog.number(name, 'replacementFactoryNotInvokedYet', 1, factory.calls);
        expect(factory.calls).assertEqual(1);
        LogicTestLog.number(name, 'replacementCleanupReleaseOnce', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await recorderTick();
        LogicTestLog.number(name, 'oldCallbackIgnoredAfterDisposal', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'oldStartIgnoredAfterDisposal', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter'
        ];
        LogicTestLog.value(name, 'disposedReplacementPending', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        gate.open();
        const replacementError: string = await replacing;
        const disposalError: string = await disposing;
        LogicTestLog.value(name, 'invalidatedReplacementError', '', replacementError);
        expect(replacementError).assertEqual('');
        LogicTestLog.value(name, 'sharedDisposalError', '', disposalError);
        expect(disposalError).assertEqual('');
        LogicTestLog.flag(name, 'disposalCompleted', disposalDone);
        expect(disposalDone).assertTrue();
        LogicTestLog.number(name, 'generationCheckedBeforeFactory', 1, factory.calls);
        expect(factory.calls).assertEqual(1);
        LogicTestLog.number(name, 'oldReleasedOnceAfterDisposal', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await recorderTick();
        LogicTestLog.number(name, 'disposedOldNeverPrepared', 0, r1.configs.length);
        expect(r1.configs.length).assertEqual(0);
        LogicTestLog.number(name, 'disposedCandidateNeverPrepared', 0, r2.configs.length);
        expect(r2.configs.length).assertEqual(0);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'noInvalidatedFactoryInvocation', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        LogicTestLog.number(name, 'factoryCountAfterReplacement', 2, factory.calls);
        expect(factory.calls).assertEqual(2);
        await model.startRecorder(1609);
        r2.emitState('prepared');
        await recorderTick();
        r2.emitState('started');
        r1.emitState('prepared');
        r1.emitState('started');
        LogicTestLog.number(name, 'latestCallbacksOnly', 2, callbacks);
        expect(callbacks).assertEqual(2);
        LogicTestLog.number(name, 'oldNeverPrepared', 0, r1.configs.length);
        expect(r1.configs.length).assertEqual(0);
        LogicTestLog.number(name, 'oldNeverStarted', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'latestPreparedOnce', 1, r2.configs.length);
        expect(r2.configs.length).assertEqual(1);
        LogicTestLog.number(name, 'latestStartedOnce', 1, r2.callCount('start'));
        expect(r2.callCount('start')).assertEqual(1);
        LogicTestLog.value(name, 'latestDescriptor', 'fd://1609', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://1609');
        await model.finish();
        r2.emitState('prepared');
        r2.emitState('paused');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'latestStopOnce', 1, r2.callCount('stop'));
        expect(r2.callCount('stop')).assertEqual(1);
        LogicTestLog.number(name, 'latestResetOnce', 1, r2.callCount('reset'));
        expect(r2.callCount('reset')).assertEqual(1);
        LogicTestLog.number(name, 'latestReleaseOnce', 1, r2.callCount('release'));
        expect(r2.callCount('release')).assertEqual(1);
        LogicTestLog.number(name, 'latestCallbacksAfterFinish', 2, callbacks);
        expect(callbacks).assertEqual(2);
        const expectedHistory3: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r2.start.enter', 'r2.start.resolve', 'r2.stop.enter', 'r2.stop.resolve',
          'r2.reset.enter', 'r2.reset.resolve', 'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory3.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory3.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1114
     * @tc.name DisposeWhileReplacingfinish
     * @tc.desc Disposal invalidates reinitialization waiting on cleanup before it can invoke the replacement
     * factory.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1114';
        const input: string =
          'oldRelease=blocked; dispose=finish; retry=success';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        r1.emitState('started');
        const gate: RecorderGate = new RecorderGate();
        r1.defer('release', gate);
        let disposalDone: boolean = false;
        const replacing: Promise<string> = recorderRejection((): Promise<void> =>
          model.initAudioRecorder((): void => { callbacks++; }));
        await recorderTick();
        const disposing: Promise<string> = recorderRejection((): Promise<void> => model.finish())
          .then((error: string): string => { disposalDone = true; return error; });
        await recorderTick();
        LogicTestLog.flag(name, 'disposalSharesReplacementCleanup', disposalDone);
        expect(disposalDone).assertFalse();
        LogicTestLog.number(name, 'replacementFactoryNotInvokedYet', 1, factory.calls);
        expect(factory.calls).assertEqual(1);
        LogicTestLog.number(name, 'replacementCleanupReleaseOnce', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        r1.emitState('prepared');
        r1.emitState('started');
        r1.emitState('paused');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await recorderTick();
        LogicTestLog.number(name, 'oldCallbackIgnoredAfterDisposal', 1, callbacks);
        expect(callbacks).assertEqual(1);
        LogicTestLog.number(name, 'oldStartIgnoredAfterDisposal', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter'
        ];
        LogicTestLog.value(name, 'disposedReplacementPending', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        gate.open();
        const replacementError: string = await replacing;
        const disposalError: string = await disposing;
        LogicTestLog.value(name, 'invalidatedReplacementError', '', replacementError);
        expect(replacementError).assertEqual('');
        LogicTestLog.value(name, 'sharedDisposalError', '', disposalError);
        expect(disposalError).assertEqual('');
        LogicTestLog.flag(name, 'disposalCompleted', disposalDone);
        expect(disposalDone).assertTrue();
        LogicTestLog.number(name, 'generationCheckedBeforeFactory', 1, factory.calls);
        expect(factory.calls).assertEqual(1);
        LogicTestLog.number(name, 'oldReleasedOnceAfterDisposal', 1, r1.callCount('release'));
        expect(r1.callCount('release')).assertEqual(1);
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await recorderTick();
        LogicTestLog.number(name, 'disposedOldNeverPrepared', 0, r1.configs.length);
        expect(r1.configs.length).assertEqual(0);
        LogicTestLog.number(name, 'disposedCandidateNeverPrepared', 0, r2.configs.length);
        expect(r2.configs.length).assertEqual(0);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'noInvalidatedFactoryInvocation', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        LogicTestLog.number(name, 'factoryCountAfterReplacement', 2, factory.calls);
        expect(factory.calls).assertEqual(2);
        await model.startRecorder(1610);
        r2.emitState('prepared');
        await recorderTick();
        r2.emitState('started');
        r1.emitState('prepared');
        r1.emitState('started');
        LogicTestLog.number(name, 'latestCallbacksOnly', 2, callbacks);
        expect(callbacks).assertEqual(2);
        LogicTestLog.number(name, 'oldNeverPrepared', 0, r1.configs.length);
        expect(r1.configs.length).assertEqual(0);
        LogicTestLog.number(name, 'oldNeverStarted', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'latestPreparedOnce', 1, r2.configs.length);
        expect(r2.configs.length).assertEqual(1);
        LogicTestLog.number(name, 'latestStartedOnce', 1, r2.callCount('start'));
        expect(r2.callCount('start')).assertEqual(1);
        LogicTestLog.value(name, 'latestDescriptor', 'fd://1610', r2.configs[0].url);
        expect(r2.configs[0].url).assertEqual('fd://1610');
        await model.finish();
        r2.emitState('prepared');
        r2.emitState('paused');
        await model.startRecorder(81);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'latestStopOnce', 1, r2.callCount('stop'));
        expect(r2.callCount('stop')).assertEqual(1);
        LogicTestLog.number(name, 'latestResetOnce', 1, r2.callCount('reset'));
        expect(r2.callCount('reset')).assertEqual(1);
        LogicTestLog.number(name, 'latestReleaseOnce', 1, r2.callCount('release'));
        expect(r2.callCount('release')).assertEqual(1);
        LogicTestLog.number(name, 'latestCallbacksAfterFinish', 2, callbacks);
        expect(callbacks).assertEqual(2);
        const expectedHistory3: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.release.enter', 'r1.release.resolve', 'factory.2.enter', 'factory.2.resolve',
          'r2.onStateChange', 'r2.onError', 'r2.prepare.enter', 'r2.prepare.resolve',
          'r2.start.enter', 'r2.start.resolve', 'r2.stop.enter', 'r2.stop.resolve',
          'r2.reset.enter', 'r2.reset.resolve', 'r2.release.enter', 'r2.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory3.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory3.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1115
     * @tc.name LatePreparedWhileFinishBlocked
     * @tc.desc Prepared and active events on a finishing detached recorder cannot start it or notify its old
     * callback.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1115';
        const input: string =
          'state=started; finishStop=blocked; late=prepared';
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
        r1.emitState('started');