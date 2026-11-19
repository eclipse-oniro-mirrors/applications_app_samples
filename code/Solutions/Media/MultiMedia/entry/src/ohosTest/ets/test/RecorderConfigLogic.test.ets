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
import type { media } from '@kit.MediaKit';
import RecordModel from '../../../main/ets/model/RecordModel';
import type { AudioRecorderPort } from '../../../main/ets/model/RecordModel';
import {
  RecorderFake, RecorderFactoryFake, RecorderGate, recorderTick
} from '../utils/RecorderFakes';
import { LogicTestLog } from '../utils/LogicTestLog';

export default function RecorderConfigLogicTest(): void {
  describe('RecorderConfigLogic', (): void => {
    beforeEach(async (): Promise<void> => {
      await recorderTick();
    });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1035
     * @tc.name Descriptor1
     * @tc.desc Each prepare receives the independent audio-only AAC profile and exact descriptor text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1035';
        const input: string =
          'fd=0';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(0);
        const config: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'configUrl', 'fd://0', config.url);
        expect(config.url).assertEqual('fd://0');
        LogicTestLog.number(name, 'configBitrate', 48000, Number(config.profile.audioBitrate));
        expect(Number(config.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'configChannels', 2, Number(config.profile.audioChannels));
        expect(Number(config.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'configSampleRate', 48000, Number(config.profile.audioSampleRate));
        expect(Number(config.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'configCodec', 'audio/mp4a-latm', String(config.profile.audioCodec));
        expect(String(config.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'configContainer', 'm4a', String(config.profile.fileFormat));
        expect(String(config.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'configSource', '1', String(config.audioSourceType));
        expect(String(config.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'configVideoSource', 'undefined', String(config.videoSourceType));
        expect(String(config.videoSourceType)).assertEqual('undefined');
        LogicTestLog.number(name, 'noStartWithoutPrepared', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'noCallbackWithoutState', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareBeforeEvents', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'preparedStarts', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        r1.emitState('started');
        LogicTestLog.number(name, 'startedNotifies', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.release();
        await model.startRecorder(0);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'clearedPrepareCount', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1036
     * @tc.name Descriptor2
     * @tc.desc Each prepare receives the independent audio-only AAC profile and exact descriptor text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1036';
        const input: string =
          'fd=1';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(1);
        const config: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'configUrl', 'fd://1', config.url);
        expect(config.url).assertEqual('fd://1');
        LogicTestLog.number(name, 'configBitrate', 48000, Number(config.profile.audioBitrate));
        expect(Number(config.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'configChannels', 2, Number(config.profile.audioChannels));
        expect(Number(config.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'configSampleRate', 48000, Number(config.profile.audioSampleRate));
        expect(Number(config.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'configCodec', 'audio/mp4a-latm', String(config.profile.audioCodec));
        expect(String(config.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'configContainer', 'm4a', String(config.profile.fileFormat));
        expect(String(config.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'configSource', '1', String(config.audioSourceType));
        expect(String(config.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'configVideoSource', 'undefined', String(config.videoSourceType));
        expect(String(config.videoSourceType)).assertEqual('undefined');
        LogicTestLog.number(name, 'noStartWithoutPrepared', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'noCallbackWithoutState', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareBeforeEvents', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'preparedStarts', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        r1.emitState('started');
        LogicTestLog.number(name, 'startedNotifies', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.release();
        await model.startRecorder(1);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'clearedPrepareCount', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1037
     * @tc.name Descriptor3
     * @tc.desc Each prepare receives the independent audio-only AAC profile and exact descriptor text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1037';
        const input: string =
          'fd=31';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(31);
        const config: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'configUrl', 'fd://31', config.url);
        expect(config.url).assertEqual('fd://31');
        LogicTestLog.number(name, 'configBitrate', 48000, Number(config.profile.audioBitrate));
        expect(Number(config.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'configChannels', 2, Number(config.profile.audioChannels));
        expect(Number(config.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'configSampleRate', 48000, Number(config.profile.audioSampleRate));
        expect(Number(config.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'configCodec', 'audio/mp4a-latm', String(config.profile.audioCodec));
        expect(String(config.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'configContainer', 'm4a', String(config.profile.fileFormat));
        expect(String(config.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'configSource', '1', String(config.audioSourceType));
        expect(String(config.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'configVideoSource', 'undefined', String(config.videoSourceType));
        expect(String(config.videoSourceType)).assertEqual('undefined');
        LogicTestLog.number(name, 'noStartWithoutPrepared', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'noCallbackWithoutState', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareBeforeEvents', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'preparedStarts', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        r1.emitState('started');
        LogicTestLog.number(name, 'startedNotifies', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.release();
        await model.startRecorder(31);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'clearedPrepareCount', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1038
     * @tc.name Descriptor4
     * @tc.desc Each prepare receives the independent audio-only AAC profile and exact descriptor text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1038';
        const input: string =
          'fd=32';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(32);
        const config: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'configUrl', 'fd://32', config.url);
        expect(config.url).assertEqual('fd://32');
        LogicTestLog.number(name, 'configBitrate', 48000, Number(config.profile.audioBitrate));
        expect(Number(config.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'configChannels', 2, Number(config.profile.audioChannels));
        expect(Number(config.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'configSampleRate', 48000, Number(config.profile.audioSampleRate));
        expect(Number(config.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'configCodec', 'audio/mp4a-latm', String(config.profile.audioCodec));
        expect(String(config.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'configContainer', 'm4a', String(config.profile.fileFormat));
        expect(String(config.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'configSource', '1', String(config.audioSourceType));
        expect(String(config.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'configVideoSource', 'undefined', String(config.videoSourceType));
        expect(String(config.videoSourceType)).assertEqual('undefined');
        LogicTestLog.number(name, 'noStartWithoutPrepared', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'noCallbackWithoutState', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareBeforeEvents', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'preparedStarts', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        r1.emitState('started');
        LogicTestLog.number(name, 'startedNotifies', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.release();
        await model.startRecorder(32);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'clearedPrepareCount', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1039
     * @tc.name Descriptor5
     * @tc.desc Each prepare receives the independent audio-only AAC profile and exact descriptor text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1039';
        const input: string =
          'fd=127';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(127);
        const config: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'configUrl', 'fd://127', config.url);
        expect(config.url).assertEqual('fd://127');
        LogicTestLog.number(name, 'configBitrate', 48000, Number(config.profile.audioBitrate));
        expect(Number(config.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'configChannels', 2, Number(config.profile.audioChannels));
        expect(Number(config.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'configSampleRate', 48000, Number(config.profile.audioSampleRate));
        expect(Number(config.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'configCodec', 'audio/mp4a-latm', String(config.profile.audioCodec));
        expect(String(config.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'configContainer', 'm4a', String(config.profile.fileFormat));
        expect(String(config.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'configSource', '1', String(config.audioSourceType));
        expect(String(config.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'configVideoSource', 'undefined', String(config.videoSourceType));
        expect(String(config.videoSourceType)).assertEqual('undefined');
        LogicTestLog.number(name, 'noStartWithoutPrepared', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'noCallbackWithoutState', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareBeforeEvents', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'preparedStarts', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        r1.emitState('started');
        LogicTestLog.number(name, 'startedNotifies', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.release();
        await model.startRecorder(127);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'clearedPrepareCount', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1040
     * @tc.name Descriptor6
     * @tc.desc Each prepare receives the independent audio-only AAC profile and exact descriptor text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1040';
        const input: string =
          'fd=255';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(255);
        const config: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'configUrl', 'fd://255', config.url);
        expect(config.url).assertEqual('fd://255');
        LogicTestLog.number(name, 'configBitrate', 48000, Number(config.profile.audioBitrate));
        expect(Number(config.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'configChannels', 2, Number(config.profile.audioChannels));
        expect(Number(config.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'configSampleRate', 48000, Number(config.profile.audioSampleRate));
        expect(Number(config.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'configCodec', 'audio/mp4a-latm', String(config.profile.audioCodec));
        expect(String(config.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'configContainer', 'm4a', String(config.profile.fileFormat));
        expect(String(config.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'configSource', '1', String(config.audioSourceType));
        expect(String(config.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'configVideoSource', 'undefined', String(config.videoSourceType));
        expect(String(config.videoSourceType)).assertEqual('undefined');
        LogicTestLog.number(name, 'noStartWithoutPrepared', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'noCallbackWithoutState', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareBeforeEvents', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'preparedStarts', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        r1.emitState('started');
        LogicTestLog.number(name, 'startedNotifies', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.release();
        await model.startRecorder(255);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'clearedPrepareCount', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1041
     * @tc.name Descriptor7
     * @tc.desc Each prepare receives the independent audio-only AAC profile and exact descriptor text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1041';
        const input: string =
          'fd=256';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(256);
        const config: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'configUrl', 'fd://256', config.url);
        expect(config.url).assertEqual('fd://256');
        LogicTestLog.number(name, 'configBitrate', 48000, Number(config.profile.audioBitrate));
        expect(Number(config.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'configChannels', 2, Number(config.profile.audioChannels));
        expect(Number(config.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'configSampleRate', 48000, Number(config.profile.audioSampleRate));
        expect(Number(config.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'configCodec', 'audio/mp4a-latm', String(config.profile.audioCodec));
        expect(String(config.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'configContainer', 'm4a', String(config.profile.fileFormat));
        expect(String(config.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'configSource', '1', String(config.audioSourceType));
        expect(String(config.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'configVideoSource', 'undefined', String(config.videoSourceType));
        expect(String(config.videoSourceType)).assertEqual('undefined');
        LogicTestLog.number(name, 'noStartWithoutPrepared', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'noCallbackWithoutState', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareBeforeEvents', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'preparedStarts', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        r1.emitState('started');
        LogicTestLog.number(name, 'startedNotifies', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.release();
        await model.startRecorder(256);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'clearedPrepareCount', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1042
     * @tc.name Descriptor8
     * @tc.desc Each prepare receives the independent audio-only AAC profile and exact descriptor text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1042';
        const input: string =
          'fd=1024';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(1024);
        const config: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'configUrl', 'fd://1024', config.url);
        expect(config.url).assertEqual('fd://1024');
        LogicTestLog.number(name, 'configBitrate', 48000, Number(config.profile.audioBitrate));
        expect(Number(config.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'configChannels', 2, Number(config.profile.audioChannels));
        expect(Number(config.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'configSampleRate', 48000, Number(config.profile.audioSampleRate));
        expect(Number(config.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'configCodec', 'audio/mp4a-latm', String(config.profile.audioCodec));
        expect(String(config.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'configContainer', 'm4a', String(config.profile.fileFormat));
        expect(String(config.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'configSource', '1', String(config.audioSourceType));
        expect(String(config.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'configVideoSource', 'undefined', String(config.videoSourceType));
        expect(String(config.videoSourceType)).assertEqual('undefined');
        LogicTestLog.number(name, 'noStartWithoutPrepared', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'noCallbackWithoutState', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareBeforeEvents', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'preparedStarts', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        r1.emitState('started');
        LogicTestLog.number(name, 'startedNotifies', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.release();
        await model.startRecorder(1024);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'clearedPrepareCount', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1043
     * @tc.name Descriptor9
     * @tc.desc Each prepare receives the independent audio-only AAC profile and exact descriptor text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1043';
        const input: string =
          'fd=4096';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(4096);
        const config: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'configUrl', 'fd://4096', config.url);
        expect(config.url).assertEqual('fd://4096');
        LogicTestLog.number(name, 'configBitrate', 48000, Number(config.profile.audioBitrate));
        expect(Number(config.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'configChannels', 2, Number(config.profile.audioChannels));
        expect(Number(config.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'configSampleRate', 48000, Number(config.profile.audioSampleRate));
        expect(Number(config.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'configCodec', 'audio/mp4a-latm', String(config.profile.audioCodec));
        expect(String(config.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'configContainer', 'm4a', String(config.profile.fileFormat));
        expect(String(config.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'configSource', '1', String(config.audioSourceType));
        expect(String(config.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'configVideoSource', 'undefined', String(config.videoSourceType));
        expect(String(config.videoSourceType)).assertEqual('undefined');
        LogicTestLog.number(name, 'noStartWithoutPrepared', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'noCallbackWithoutState', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareBeforeEvents', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'preparedStarts', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        r1.emitState('started');
        LogicTestLog.number(name, 'startedNotifies', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.release();
        await model.startRecorder(4096);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'clearedPrepareCount', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1044
     * @tc.name Descriptor10
     * @tc.desc Each prepare receives the independent audio-only AAC profile and exact descriptor text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1044';
        const input: string =
          'fd=65535';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(65535);
        const config: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'configUrl', 'fd://65535', config.url);
        expect(config.url).assertEqual('fd://65535');
        LogicTestLog.number(name, 'configBitrate', 48000, Number(config.profile.audioBitrate));
        expect(Number(config.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'configChannels', 2, Number(config.profile.audioChannels));
        expect(Number(config.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'configSampleRate', 48000, Number(config.profile.audioSampleRate));
        expect(Number(config.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'configCodec', 'audio/mp4a-latm', String(config.profile.audioCodec));
        expect(String(config.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'configContainer', 'm4a', String(config.profile.fileFormat));
        expect(String(config.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'configSource', '1', String(config.audioSourceType));
        expect(String(config.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'configVideoSource', 'undefined', String(config.videoSourceType));
        expect(String(config.videoSourceType)).assertEqual('undefined');
        LogicTestLog.number(name, 'noStartWithoutPrepared', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'noCallbackWithoutState', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareBeforeEvents', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'preparedStarts', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        r1.emitState('started');
        LogicTestLog.number(name, 'startedNotifies', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.release();
        await model.startRecorder(65535);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'clearedPrepareCount', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1045
     * @tc.name Descriptor11
     * @tc.desc Each prepare receives the independent audio-only AAC profile and exact descriptor text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1045';
        const input: string =
          'fd=2147483647';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(2147483647);
        const config: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'configUrl', 'fd://2147483647', config.url);
        expect(config.url).assertEqual('fd://2147483647');
        LogicTestLog.number(name, 'configBitrate', 48000, Number(config.profile.audioBitrate));
        expect(Number(config.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'configChannels', 2, Number(config.profile.audioChannels));
        expect(Number(config.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'configSampleRate', 48000, Number(config.profile.audioSampleRate));
        expect(Number(config.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'configCodec', 'audio/mp4a-latm', String(config.profile.audioCodec));
        expect(String(config.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'configContainer', 'm4a', String(config.profile.fileFormat));
        expect(String(config.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'configSource', '1', String(config.audioSourceType));
        expect(String(config.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'configVideoSource', 'undefined', String(config.videoSourceType));
        expect(String(config.videoSourceType)).assertEqual('undefined');
        LogicTestLog.number(name, 'noStartWithoutPrepared', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'noCallbackWithoutState', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareBeforeEvents', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'preparedStarts', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        r1.emitState('started');
        LogicTestLog.number(name, 'startedNotifies', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.release();
        await model.startRecorder(2147483647);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'clearedPrepareCount', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1046
     * @tc.name Descriptor12
     * @tc.desc Each prepare receives the independent audio-only AAC profile and exact descriptor text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1046';
        const input: string =
          'fd=9007199254740991';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(9007199254740991);
        const config: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'configUrl', 'fd://9007199254740991', config.url);
        expect(config.url).assertEqual('fd://9007199254740991');
        LogicTestLog.number(name, 'configBitrate', 48000, Number(config.profile.audioBitrate));
        expect(Number(config.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'configChannels', 2, Number(config.profile.audioChannels));
        expect(Number(config.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'configSampleRate', 48000, Number(config.profile.audioSampleRate));
        expect(Number(config.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'configCodec', 'audio/mp4a-latm', String(config.profile.audioCodec));
        expect(String(config.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'configContainer', 'm4a', String(config.profile.fileFormat));
        expect(String(config.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'configSource', '1', String(config.audioSourceType));
        expect(String(config.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'configVideoSource', 'undefined', String(config.videoSourceType));
        expect(String(config.videoSourceType)).assertEqual('undefined');
        LogicTestLog.number(name, 'noStartWithoutPrepared', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'noCallbackWithoutState', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareBeforeEvents', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'preparedStarts', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        r1.emitState('started');
        LogicTestLog.number(name, 'startedNotifies', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.release();
        await model.startRecorder(9007199254740991);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'clearedPrepareCount', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1047
     * @tc.name Descriptor13
     * @tc.desc Each prepare receives the independent audio-only AAC profile and exact descriptor text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1047';
        const input: string =
          'fd=-1';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(-1);
        const config: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'configUrl', 'fd://-1', config.url);
        expect(config.url).assertEqual('fd://-1');
        LogicTestLog.number(name, 'configBitrate', 48000, Number(config.profile.audioBitrate));
        expect(Number(config.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'configChannels', 2, Number(config.profile.audioChannels));
        expect(Number(config.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'configSampleRate', 48000, Number(config.profile.audioSampleRate));
        expect(Number(config.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'configCodec', 'audio/mp4a-latm', String(config.profile.audioCodec));
        expect(String(config.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'configContainer', 'm4a', String(config.profile.fileFormat));
        expect(String(config.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'configSource', '1', String(config.audioSourceType));
        expect(String(config.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'configVideoSource', 'undefined', String(config.videoSourceType));
        expect(String(config.videoSourceType)).assertEqual('undefined');
        LogicTestLog.number(name, 'noStartWithoutPrepared', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'noCallbackWithoutState', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareBeforeEvents', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'preparedStarts', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        r1.emitState('started');
        LogicTestLog.number(name, 'startedNotifies', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.release();
        await model.startRecorder(-1);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'clearedPrepareCount', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1048
     * @tc.name Descriptor14
     * @tc.desc Each prepare receives the independent audio-only AAC profile and exact descriptor text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1048';
        const input: string =
          'fd=-17';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(-17);
        const config: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'configUrl', 'fd://-17', config.url);
        expect(config.url).assertEqual('fd://-17');
        LogicTestLog.number(name, 'configBitrate', 48000, Number(config.profile.audioBitrate));
        expect(Number(config.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'configChannels', 2, Number(config.profile.audioChannels));
        expect(Number(config.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'configSampleRate', 48000, Number(config.profile.audioSampleRate));
        expect(Number(config.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'configCodec', 'audio/mp4a-latm', String(config.profile.audioCodec));
        expect(String(config.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'configContainer', 'm4a', String(config.profile.fileFormat));
        expect(String(config.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'configSource', '1', String(config.audioSourceType));
        expect(String(config.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'configVideoSource', 'undefined', String(config.videoSourceType));
        expect(String(config.videoSourceType)).assertEqual('undefined');
        LogicTestLog.number(name, 'noStartWithoutPrepared', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'noCallbackWithoutState', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareBeforeEvents', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'preparedStarts', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        r1.emitState('started');
        LogicTestLog.number(name, 'startedNotifies', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.release();
        await model.startRecorder(-17);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'clearedPrepareCount', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1049
     * @tc.name Descriptor15
     * @tc.desc Each prepare receives the independent audio-only AAC profile and exact descriptor text.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1049';
        const input: string =
          'fd=1.25';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(1.25);
        const config: media.AVRecorderConfig = r1.configs[0];
        LogicTestLog.value(name, 'configUrl', 'fd://1.25', config.url);
        expect(config.url).assertEqual('fd://1.25');
        LogicTestLog.number(name, 'configBitrate', 48000, Number(config.profile.audioBitrate));
        expect(Number(config.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'configChannels', 2, Number(config.profile.audioChannels));
        expect(Number(config.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'configSampleRate', 48000, Number(config.profile.audioSampleRate));
        expect(Number(config.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'configCodec', 'audio/mp4a-latm', String(config.profile.audioCodec));
        expect(String(config.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'configContainer', 'm4a', String(config.profile.fileFormat));
        expect(String(config.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'configSource', '1', String(config.audioSourceType));
        expect(String(config.audioSourceType)).assertEqual('1');
        LogicTestLog.value(name, 'configVideoSource', 'undefined', String(config.videoSourceType));
        expect(String(config.videoSourceType)).assertEqual('undefined');
        LogicTestLog.number(name, 'noStartWithoutPrepared', 0, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(0);
        LogicTestLog.number(name, 'noCallbackWithoutState', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'prepareBeforeEvents', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        LogicTestLog.number(name, 'preparedStarts', 1, r1.callCount('start'));
        expect(r1.callCount('start')).assertEqual(1);
        r1.emitState('started');
        LogicTestLog.number(name, 'startedNotifies', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.release();
        await model.startRecorder(1.25);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'clearedPrepareCount', 1, r1.configs.length);
        expect(r1.configs.length).assertEqual(1);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.start.enter', 'r1.start.resolve',
          'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1050
     * @tc.name RepeatedConfig1
     * @tc.desc Successive prepares allocate distinct configs and profiles without rewriting retained URLs.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1050';
        const input: string =
          'first=1; second=1';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(1);
        const first: media.AVRecorderConfig = r1.configs[0];
        await model.startRecorder(1);
        const second: media.AVRecorderConfig = r1.configs[1];
        LogicTestLog.number(name, 'twoCapturedConfigs', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        LogicTestLog.flag(name, 'distinctConfigsExpectedTrue', first !== second);
        expect(first !== second).assertTrue();
        LogicTestLog.flag(name, 'distinctProfilesExpectedTrue', first.profile !== second.profile);
        expect(first.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'firstDescriptorStillIntact', 'fd://1', first.url);
        expect(first.url).assertEqual('fd://1');
        LogicTestLog.value(name, 'secondUrl', 'fd://1', second.url);
        expect(second.url).assertEqual('fd://1');
        LogicTestLog.number(name, 'secondBitrate', 48000, Number(second.profile.audioBitrate));
        expect(Number(second.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'secondChannels', 2, Number(second.profile.audioChannels));
        expect(Number(second.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'secondSampleRate', 48000, Number(second.profile.audioSampleRate));
        expect(Number(second.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'secondCodec', 'audio/mp4a-latm', String(second.profile.audioCodec));
        expect(String(second.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'secondContainer', 'm4a', String(second.profile.fileFormat));
        expect(String(second.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'secondSource', '1', String(second.audioSourceType));
        expect(String(second.audioSourceType)).assertEqual('1');
        LogicTestLog.number(name, 'noImplicitCallbacks', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'twoPrepareOrder', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        r1.emitState('started');
        LogicTestLog.number(name, 'explicitStartedCallback', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.finish();
        await model.startRecorder(1);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'noThirdPrepare', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve',
          'r1.start.enter', 'r1.start.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1051
     * @tc.name RepeatedConfig2
     * @tc.desc Successive prepares allocate distinct configs and profiles without rewriting retained URLs.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1051';
        const input: string =
          'first=0; second=1';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(0);
        const first: media.AVRecorderConfig = r1.configs[0];
        await model.startRecorder(1);
        const second: media.AVRecorderConfig = r1.configs[1];
        LogicTestLog.number(name, 'twoCapturedConfigs', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        LogicTestLog.flag(name, 'distinctConfigsExpectedTrue', first !== second);
        expect(first !== second).assertTrue();
        LogicTestLog.flag(name, 'distinctProfilesExpectedTrue', first.profile !== second.profile);
        expect(first.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'firstDescriptorStillIntact', 'fd://0', first.url);
        expect(first.url).assertEqual('fd://0');
        LogicTestLog.value(name, 'secondUrl', 'fd://1', second.url);
        expect(second.url).assertEqual('fd://1');
        LogicTestLog.number(name, 'secondBitrate', 48000, Number(second.profile.audioBitrate));
        expect(Number(second.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'secondChannels', 2, Number(second.profile.audioChannels));
        expect(Number(second.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'secondSampleRate', 48000, Number(second.profile.audioSampleRate));
        expect(Number(second.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'secondCodec', 'audio/mp4a-latm', String(second.profile.audioCodec));
        expect(String(second.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'secondContainer', 'm4a', String(second.profile.fileFormat));
        expect(String(second.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'secondSource', '1', String(second.audioSourceType));
        expect(String(second.audioSourceType)).assertEqual('1');
        LogicTestLog.number(name, 'noImplicitCallbacks', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'twoPrepareOrder', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        r1.emitState('started');
        LogicTestLog.number(name, 'explicitStartedCallback', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.finish();
        await model.startRecorder(1);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'noThirdPrepare', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve',
          'r1.start.enter', 'r1.start.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1052
     * @tc.name RepeatedConfig3
     * @tc.desc Successive prepares allocate distinct configs and profiles without rewriting retained URLs.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1052';
        const input: string =
          'first=255; second=256';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(255);
        const first: media.AVRecorderConfig = r1.configs[0];
        await model.startRecorder(256);
        const second: media.AVRecorderConfig = r1.configs[1];
        LogicTestLog.number(name, 'twoCapturedConfigs', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        LogicTestLog.flag(name, 'distinctConfigsExpectedTrue', first !== second);
        expect(first !== second).assertTrue();
        LogicTestLog.flag(name, 'distinctProfilesExpectedTrue', first.profile !== second.profile);
        expect(first.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'firstDescriptorStillIntact', 'fd://255', first.url);
        expect(first.url).assertEqual('fd://255');
        LogicTestLog.value(name, 'secondUrl', 'fd://256', second.url);
        expect(second.url).assertEqual('fd://256');
        LogicTestLog.number(name, 'secondBitrate', 48000, Number(second.profile.audioBitrate));
        expect(Number(second.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'secondChannels', 2, Number(second.profile.audioChannels));
        expect(Number(second.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'secondSampleRate', 48000, Number(second.profile.audioSampleRate));
        expect(Number(second.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'secondCodec', 'audio/mp4a-latm', String(second.profile.audioCodec));
        expect(String(second.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'secondContainer', 'm4a', String(second.profile.fileFormat));
        expect(String(second.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'secondSource', '1', String(second.audioSourceType));
        expect(String(second.audioSourceType)).assertEqual('1');
        LogicTestLog.number(name, 'noImplicitCallbacks', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'twoPrepareOrder', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        r1.emitState('started');
        LogicTestLog.number(name, 'explicitStartedCallback', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.finish();
        await model.startRecorder(256);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'noThirdPrepare', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve',
          'r1.start.enter', 'r1.start.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1053
     * @tc.name RepeatedConfig4
     * @tc.desc Successive prepares allocate distinct configs and profiles without rewriting retained URLs.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1053';
        const input: string =
          'first=4095; second=4096';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(4095);
        const first: media.AVRecorderConfig = r1.configs[0];
        await model.startRecorder(4096);
        const second: media.AVRecorderConfig = r1.configs[1];
        LogicTestLog.number(name, 'twoCapturedConfigs', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        LogicTestLog.flag(name, 'distinctConfigsExpectedTrue', first !== second);
        expect(first !== second).assertTrue();
        LogicTestLog.flag(name, 'distinctProfilesExpectedTrue', first.profile !== second.profile);
        expect(first.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'firstDescriptorStillIntact', 'fd://4095', first.url);
        expect(first.url).assertEqual('fd://4095');
        LogicTestLog.value(name, 'secondUrl', 'fd://4096', second.url);
        expect(second.url).assertEqual('fd://4096');
        LogicTestLog.number(name, 'secondBitrate', 48000, Number(second.profile.audioBitrate));
        expect(Number(second.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'secondChannels', 2, Number(second.profile.audioChannels));
        expect(Number(second.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'secondSampleRate', 48000, Number(second.profile.audioSampleRate));
        expect(Number(second.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'secondCodec', 'audio/mp4a-latm', String(second.profile.audioCodec));
        expect(String(second.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'secondContainer', 'm4a', String(second.profile.fileFormat));
        expect(String(second.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'secondSource', '1', String(second.audioSourceType));
        expect(String(second.audioSourceType)).assertEqual('1');
        LogicTestLog.number(name, 'noImplicitCallbacks', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'twoPrepareOrder', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        r1.emitState('started');
        LogicTestLog.number(name, 'explicitStartedCallback', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.finish();
        await model.startRecorder(4096);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'noThirdPrepare', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve',
          'r1.start.enter', 'r1.start.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1054
     * @tc.name RepeatedConfig5
     * @tc.desc Successive prepares allocate distinct configs and profiles without rewriting retained URLs.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1054';
        const input: string =
          'first=-1; second=42';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(-1);
        const first: media.AVRecorderConfig = r1.configs[0];
        await model.startRecorder(42);
        const second: media.AVRecorderConfig = r1.configs[1];
        LogicTestLog.number(name, 'twoCapturedConfigs', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        LogicTestLog.flag(name, 'distinctConfigsExpectedTrue', first !== second);
        expect(first !== second).assertTrue();
        LogicTestLog.flag(name, 'distinctProfilesExpectedTrue', first.profile !== second.profile);
        expect(first.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'firstDescriptorStillIntact', 'fd://-1', first.url);
        expect(first.url).assertEqual('fd://-1');
        LogicTestLog.value(name, 'secondUrl', 'fd://42', second.url);
        expect(second.url).assertEqual('fd://42');
        LogicTestLog.number(name, 'secondBitrate', 48000, Number(second.profile.audioBitrate));
        expect(Number(second.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'secondChannels', 2, Number(second.profile.audioChannels));
        expect(Number(second.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'secondSampleRate', 48000, Number(second.profile.audioSampleRate));
        expect(Number(second.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'secondCodec', 'audio/mp4a-latm', String(second.profile.audioCodec));
        expect(String(second.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'secondContainer', 'm4a', String(second.profile.fileFormat));
        expect(String(second.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'secondSource', '1', String(second.audioSourceType));
        expect(String(second.audioSourceType)).assertEqual('1');
        LogicTestLog.number(name, 'noImplicitCallbacks', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'twoPrepareOrder', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        r1.emitState('started');
        LogicTestLog.number(name, 'explicitStartedCallback', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.finish();
        await model.startRecorder(42);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'noThirdPrepare', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve',
          'r1.start.enter', 'r1.start.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1055
     * @tc.name RepeatedConfig6
     * @tc.desc Successive prepares allocate distinct configs and profiles without rewriting retained URLs.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1055';
        const input: string =
          'first=1.25; second=2.5';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(1.25);
        const first: media.AVRecorderConfig = r1.configs[0];
        await model.startRecorder(2.5);
        const second: media.AVRecorderConfig = r1.configs[1];
        LogicTestLog.number(name, 'twoCapturedConfigs', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        LogicTestLog.flag(name, 'distinctConfigsExpectedTrue', first !== second);
        expect(first !== second).assertTrue();
        LogicTestLog.flag(name, 'distinctProfilesExpectedTrue', first.profile !== second.profile);
        expect(first.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'firstDescriptorStillIntact', 'fd://1.25', first.url);
        expect(first.url).assertEqual('fd://1.25');
        LogicTestLog.value(name, 'secondUrl', 'fd://2.5', second.url);
        expect(second.url).assertEqual('fd://2.5');
        LogicTestLog.number(name, 'secondBitrate', 48000, Number(second.profile.audioBitrate));
        expect(Number(second.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'secondChannels', 2, Number(second.profile.audioChannels));
        expect(Number(second.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'secondSampleRate', 48000, Number(second.profile.audioSampleRate));
        expect(Number(second.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'secondCodec', 'audio/mp4a-latm', String(second.profile.audioCodec));
        expect(String(second.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'secondContainer', 'm4a', String(second.profile.fileFormat));
        expect(String(second.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'secondSource', '1', String(second.audioSourceType));
        expect(String(second.audioSourceType)).assertEqual('1');
        LogicTestLog.number(name, 'noImplicitCallbacks', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'twoPrepareOrder', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        r1.emitState('started');
        LogicTestLog.number(name, 'explicitStartedCallback', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.finish();
        await model.startRecorder(2.5);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'noThirdPrepare', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve',
          'r1.start.enter', 'r1.start.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1056
     * @tc.name RepeatedConfig7
     * @tc.desc Successive prepares allocate distinct configs and profiles without rewriting retained URLs.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1056';
        const input: string =
          'first=2147483647; second=2147483648';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(2147483647);
        const first: media.AVRecorderConfig = r1.configs[0];
        await model.startRecorder(2147483648);
        const second: media.AVRecorderConfig = r1.configs[1];
        LogicTestLog.number(name, 'twoCapturedConfigs', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        LogicTestLog.flag(name, 'distinctConfigsExpectedTrue', first !== second);
        expect(first !== second).assertTrue();
        LogicTestLog.flag(name, 'distinctProfilesExpectedTrue', first.profile !== second.profile);
        expect(first.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'firstDescriptorStillIntact', 'fd://2147483647', first.url);
        expect(first.url).assertEqual('fd://2147483647');
        LogicTestLog.value(name, 'secondUrl', 'fd://2147483648', second.url);
        expect(second.url).assertEqual('fd://2147483648');
        LogicTestLog.number(name, 'secondBitrate', 48000, Number(second.profile.audioBitrate));
        expect(Number(second.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'secondChannels', 2, Number(second.profile.audioChannels));
        expect(Number(second.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'secondSampleRate', 48000, Number(second.profile.audioSampleRate));
        expect(Number(second.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'secondCodec', 'audio/mp4a-latm', String(second.profile.audioCodec));
        expect(String(second.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'secondContainer', 'm4a', String(second.profile.fileFormat));
        expect(String(second.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'secondSource', '1', String(second.audioSourceType));
        expect(String(second.audioSourceType)).assertEqual('1');
        LogicTestLog.number(name, 'noImplicitCallbacks', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'twoPrepareOrder', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        r1.emitState('started');
        LogicTestLog.number(name, 'explicitStartedCallback', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.finish();
        await model.startRecorder(2147483648);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'noThirdPrepare', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve',
          'r1.start.enter', 'r1.start.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1057
     * @tc.name RepeatedConfig8
     * @tc.desc Successive prepares allocate distinct configs and profiles without rewriting retained URLs.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1057';
        const input: string =
          'first=9007199254740990; second=9007199254740991';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(9007199254740990);
        const first: media.AVRecorderConfig = r1.configs[0];
        await model.startRecorder(9007199254740991);
        const second: media.AVRecorderConfig = r1.configs[1];
        LogicTestLog.number(name, 'twoCapturedConfigs', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        LogicTestLog.flag(name, 'distinctConfigsExpectedTrue', first !== second);
        expect(first !== second).assertTrue();
        LogicTestLog.flag(name, 'distinctProfilesExpectedTrue', first.profile !== second.profile);
        expect(first.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'firstDescriptorStillIntact', 'fd://9007199254740990', first.url);
        expect(first.url).assertEqual('fd://9007199254740990');
        LogicTestLog.value(name, 'secondUrl', 'fd://9007199254740991', second.url);
        expect(second.url).assertEqual('fd://9007199254740991');
        LogicTestLog.number(name, 'secondBitrate', 48000, Number(second.profile.audioBitrate));
        expect(Number(second.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'secondChannels', 2, Number(second.profile.audioChannels));
        expect(Number(second.profile.audioChannels)).assertEqual(2);
        LogicTestLog.number(name, 'secondSampleRate', 48000, Number(second.profile.audioSampleRate));
        expect(Number(second.profile.audioSampleRate)).assertEqual(48000);
        LogicTestLog.value(name, 'secondCodec', 'audio/mp4a-latm', String(second.profile.audioCodec));
        expect(String(second.profile.audioCodec)).assertEqual('audio/mp4a-latm');
        LogicTestLog.value(name, 'secondContainer', 'm4a', String(second.profile.fileFormat));
        expect(String(second.profile.fileFormat)).assertEqual('m4a');
        LogicTestLog.value(name, 'secondSource', '1', String(second.audioSourceType));
        expect(String(second.audioSourceType)).assertEqual('1');
        LogicTestLog.number(name, 'noImplicitCallbacks', 0, callbacks);
        expect(callbacks).assertEqual(0);
        const expectedHistory1: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve'
        ];
        LogicTestLog.value(name, 'twoPrepareOrder', expectedHistory1.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory1.join('|'));
        r1.emitState('prepared');
        await recorderTick();
        r1.emitState('started');
        LogicTestLog.number(name, 'explicitStartedCallback', 1, callbacks);
        expect(callbacks).assertEqual(1);
        await model.finish();
        await model.startRecorder(9007199254740991);
        model.pause();
        model.resume();
        await model.finish();
        await model.release();
        await recorderTick();
        LogicTestLog.number(name, 'noThirdPrepare', 2, r1.configs.length);
        expect(r1.configs.length).assertEqual(2);
        const expectedHistory2: string[] = [
          'factory.1.enter', 'factory.1.resolve', 'r1.onStateChange', 'r1.onError',
          'r1.prepare.enter', 'r1.prepare.resolve', 'r1.prepare.enter', 'r1.prepare.resolve',
          'r1.start.enter', 'r1.start.resolve', 'r1.stop.enter', 'r1.stop.resolve',
          'r1.reset.enter', 'r1.reset.resolve', 'r1.release.enter', 'r1.release.resolve'
        ];
        LogicTestLog.value(name, 'orderedCalls', expectedHistory2.join('|'), history.join('|'));
        expect(history.join('|')).assertEqual(expectedHistory2.join('|'));
        LogicTestLog.end(name);
      });

    /**
     * @tc.number SUB_SYS_MULTIMEDIA_RECORD_1058
     * @tc.name InstanceIsolation1
     * @tc.desc Mutated retained configs cannot contaminate another model or the next same-model prepare.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_SYS_MULTIMEDIA_RECORD_1058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (): Promise<void> => {
        const name: string = 'SUB_SYS_MULTIMEDIA_RECORD_1058';
        const input: string =
          'a=11; b=12; again=13; mutated=96000/1/16000';
        LogicTestLog.begin(name, input);
        const history: string[] = [];
        const r1: RecorderFake = new RecorderFake('r1', history);
        const r2: RecorderFake = new RecorderFake('r2', history);
        const factory: RecorderFactoryFake = new RecorderFactoryFake([r1, r2], history);
        const model: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let callbacks: number = 0;
        const other: RecordModel = new RecordModel((): Promise<AudioRecorderPort> => factory.create());
        let otherCallbacks: number = 0;
        await model.initAudioRecorder((): void => {
          callbacks++;
        });
        await model.startRecorder(11);
        const first: media.AVRecorderConfig = r1.configs[0];
        first.url = 'fd://mutated-0';
        first.profile.audioBitrate = 96000;
        first.profile.audioChannels = 1;
        first.profile.audioSampleRate = 16000;
        await other.initAudioRecorder((): void => {
          otherCallbacks++;
        });
        await other.startRecorder(12);
        const second: media.AVRecorderConfig = r2.configs[0];
        LogicTestLog.flag(name, 'crossInstanceConfigIdentityExpectedTrue', first !== second);
        expect(first !== second).assertTrue();
        LogicTestLog.flag(name, 'crossInstanceProfileIdentityExpectedTrue', first.profile !== second.profile);
        expect(first.profile !== second.profile).assertTrue();
        LogicTestLog.value(name, 'secondUrl', 'fd://12', second.url);
        expect(second.url).assertEqual('fd://12');
        LogicTestLog.number(name, 'secondBitrate', 48000, Number(second.profile.audioBitrate));
        expect(Number(second.profile.audioBitrate)).assertEqual(48000);
        LogicTestLog.number(name, 'secondChannels', 2, Number(second.profile.audioChannels));
        expect(Number(second.profile.audioChannels)).assertEqual(2);