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

import { beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from '../EventLoopYield';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { SocketCommandKind, classifyCommand } from '../SocketCommandParser';

const DOMAIN: number = 0xF811;
const TAG: string = '[Sample_Socket]';
const BUNDLE: string = 'Socket_';

function logInfo(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

/** Logic checks for classifyCommand (29 cases). */
export default function classifyCommand2Test(): void {
  describe('ClassifyCommand2Test', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0097
     * @tc.name      Socket_ClassifyCommand_0097
     * @tc.desc      classifyCommand(text="S") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0097', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0097 begin`);
      const actual: SocketCommandKind = classifyCommand('S');
      logInfo(`classifyCommand(text="S"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0097 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0098
     * @tc.name      Socket_ClassifyCommand_0098
     * @tc.desc      classifyCommand(text="BqsCm") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0098', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0098 begin`);
      const actual: SocketCommandKind = classifyCommand('BqsCm');
      logInfo(`classifyCommand(text="BqsCm"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0098 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0099
     * @tc.name      Socket_ClassifyCommand_0099
     * @tc.desc      classifyCommand(text="UOlxMxvjT") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0099', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0099 begin`);
      const actual: SocketCommandKind = classifyCommand('UOlxMxvjT');
      logInfo(`classifyCommand(text="UOlxMxvjT"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0099 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0100
     * @tc.name      Socket_ClassifyCommand_0100
     * @tc.desc      classifyCommand(text="mIhYZQB9f7rX") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0100 begin`);
      const actual: SocketCommandKind = classifyCommand('mIhYZQB9f7rX');
      logInfo(`classifyCommand(text="mIhYZQB9f7rX"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0100 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0101
     * @tc.name      Socket_ClassifyCommand_0101
     * @tc.desc      classifyCommand(text="xLDF1JvFJ") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0101 begin`);
      const actual: SocketCommandKind = classifyCommand('xLDF1JvFJ');
      logInfo(`classifyCommand(text="xLDF1JvFJ"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0101 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0102
     * @tc.name      Socket_ClassifyCommand_0102
     * @tc.desc      classifyCommand(text="9Wwm73") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0102 begin`);
      const actual: SocketCommandKind = classifyCommand('9Wwm73');
      logInfo(`classifyCommand(text="9Wwm73"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0102 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0103
     * @tc.name      Socket_ClassifyCommand_0103
     * @tc.desc      classifyCommand(text="jAi") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0103 begin`);
      const actual: SocketCommandKind = classifyCommand('jAi');
      logInfo(`classifyCommand(text="jAi"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0103 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0104
     * @tc.name      Socket_ClassifyCommand_0104
     * @tc.desc      classifyCommand(text="B16Vk9jqVam") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0104 begin`);
      const actual: SocketCommandKind = classifyCommand('B16Vk9jqVam');
      logInfo(`classifyCommand(text="B16Vk9jqVam"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0104 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0105
     * @tc.name      Socket_ClassifyCommand_0105
     * @tc.desc      classifyCommand(text="z3M4A") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0105 begin`);
      const actual: SocketCommandKind = classifyCommand('z3M4A');
      logInfo(`classifyCommand(text="z3M4A"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0105 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0106
     * @tc.name      Socket_ClassifyCommand_0106
     * @tc.desc      classifyCommand(text="kmB6ajSmHT") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0106 begin`);
      const actual: SocketCommandKind = classifyCommand('kmB6ajSmHT');
      logInfo(`classifyCommand(text="kmB6ajSmHT"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0106 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0107
     * @tc.name      Socket_ClassifyCommand_0107
     * @tc.desc      classifyCommand(text="c8BcTP5JkzsV") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0107 begin`);
      const actual: SocketCommandKind = classifyCommand('c8BcTP5JkzsV');
      logInfo(`classifyCommand(text="c8BcTP5JkzsV"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0107 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0108
     * @tc.name      Socket_ClassifyCommand_0108
     * @tc.desc      classifyCommand(text="hAB5u") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0108 begin`);
      const actual: SocketCommandKind = classifyCommand('hAB5u');
      logInfo(`classifyCommand(text="hAB5u"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0108 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0109
     * @tc.name      Socket_ClassifyCommand_0109
     * @tc.desc      classifyCommand(text="I88lCa1") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0109 begin`);
      const actual: SocketCommandKind = classifyCommand('I88lCa1');
      logInfo(`classifyCommand(text="I88lCa1"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0109 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0110
     * @tc.name      Socket_ClassifyCommand_0110
     * @tc.desc      classifyCommand(text="vUWBUf4O3o3") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0110 begin`);
      const actual: SocketCommandKind = classifyCommand('vUWBUf4O3o3');
      logInfo(`classifyCommand(text="vUWBUf4O3o3"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0110 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0111
     * @tc.name      Socket_ClassifyCommand_0111
     * @tc.desc      classifyCommand(text="Ii0k") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0111 begin`);
      const actual: SocketCommandKind = classifyCommand('Ii0k');
      logInfo(`classifyCommand(text="Ii0k"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0111 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0112
     * @tc.name      Socket_ClassifyCommand_0112
     * @tc.desc      classifyCommand(text="t4nTeH05") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0112 begin`);
      const actual: SocketCommandKind = classifyCommand('t4nTeH05');
      logInfo(`classifyCommand(text="t4nTeH05"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0112 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0113
     * @tc.name      Socket_ClassifyCommand_0113
     * @tc.desc      classifyCommand(text="tjtJDUo5a7KN") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0113 begin`);
      const actual: SocketCommandKind = classifyCommand('tjtJDUo5a7KN');
      logInfo(`classifyCommand(text="tjtJDUo5a7KN"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0113 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0114
     * @tc.name      Socket_ClassifyCommand_0114
     * @tc.desc      classifyCommand(text="nLWhuM") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0114 begin`);
      const actual: SocketCommandKind = classifyCommand('nLWhuM');
      logInfo(`classifyCommand(text="nLWhuM"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0114 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0115
     * @tc.name      Socket_ClassifyCommand_0115
     * @tc.desc      classifyCommand(text="uco9") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0115 begin`);
      const actual: SocketCommandKind = classifyCommand('uco9');
      logInfo(`classifyCommand(text="uco9"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0115 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0116
     * @tc.name      Socket_ClassifyCommand_0116
     * @tc.desc      classifyCommand(text="e3koLt") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0116 begin`);
      const actual: SocketCommandKind = classifyCommand('e3koLt');
      logInfo(`classifyCommand(text="e3koLt"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0116 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0117
     * @tc.name      Socket_ClassifyCommand_0117
     * @tc.desc      classifyCommand(text="8MzzhbTE") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0117 begin`);
      const actual: SocketCommandKind = classifyCommand('8MzzhbTE');
      logInfo(`classifyCommand(text="8MzzhbTE"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0117 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0118
     * @tc.name      Socket_ClassifyCommand_0118
     * @tc.desc      classifyCommand(text="bau24Yiyb0") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0118 begin`);
      const actual: SocketCommandKind = classifyCommand('bau24Yiyb0');
      logInfo(`classifyCommand(text="bau24Yiyb0"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0118 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0119
     * @tc.name      Socket_ClassifyCommand_0119
     * @tc.desc      classifyCommand(text="rKZSa") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0119 begin`);
      const actual: SocketCommandKind = classifyCommand('rKZSa');
      logInfo(`classifyCommand(text="rKZSa"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0119 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0120
     * @tc.name      Socket_ClassifyCommand_0120
     * @tc.desc      classifyCommand(text="NhhHfcPMFPZK") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0120 begin`);
      const actual: SocketCommandKind = classifyCommand('NhhHfcPMFPZK');
      logInfo(`classifyCommand(text="NhhHfcPMFPZK"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0120 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0121
     * @tc.name      Socket_ClassifyCommand_0121
     * @tc.desc      classifyCommand(text="m") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0121 begin`);
      const actual: SocketCommandKind = classifyCommand('m');
      logInfo(`classifyCommand(text="m"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0121 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0122
     * @tc.name      Socket_ClassifyCommand_0122
     * @tc.desc      classifyCommand(text="V4LPHnZtj215") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0122 begin`);
      const actual: SocketCommandKind = classifyCommand('V4LPHnZtj215');
      logInfo(`classifyCommand(text="V4LPHnZtj215"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0122 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0123
     * @tc.name      Socket_ClassifyCommand_0123
     * @tc.desc      classifyCommand(text="XRMmDN9AK") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0123 begin`);
      const actual: SocketCommandKind = classifyCommand('XRMmDN9AK');
      logInfo(`classifyCommand(text="XRMmDN9AK"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0123 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0124
     * @tc.name      Socket_ClassifyCommand_0124
     * @tc.desc      classifyCommand(text="1IpbK") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0124 begin`);
      const actual: SocketCommandKind = classifyCommand('1IpbK');
      logInfo(`classifyCommand(text="1IpbK"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0124 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0125
     * @tc.name      Socket_ClassifyCommand_0125
     * @tc.desc      classifyCommand(text="aJYrXqLg8") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0125 begin`);
      const actual: SocketCommandKind = classifyCommand('aJYrXqLg8');
      logInfo(`classifyCommand(text="aJYrXqLg8"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0125 end`);
    });
  });
}
