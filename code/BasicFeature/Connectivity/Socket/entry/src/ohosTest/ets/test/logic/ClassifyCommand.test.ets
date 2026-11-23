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

/** Logic checks for classifyCommand (96 cases). */
export default function classifyCommandTest(): void {
  describe('ClassifyCommandTest', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0001
     * @tc.name      Socket_ClassifyCommand_0001
     * @tc.desc      classifyCommand(text="online") returns SocketCommandKind.ONLINE
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Socket_ClassifyCommand_0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0001 begin`);
      const actual: SocketCommandKind = classifyCommand('online');
      logInfo(`classifyCommand(text="online"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.ONLINE);
      logInfo(`${BUNDLE}ClassifyCommand_0001 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0002
     * @tc.name      Socket_ClassifyCommand_0002
     * @tc.desc      classifyCommand(text="offline") returns SocketCommandKind.OFFLINE
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('Socket_ClassifyCommand_0002', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0002 begin`);
      const actual: SocketCommandKind = classifyCommand('offline');
      logInfo(`classifyCommand(text="offline"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.OFFLINE);
      logInfo(`${BUNDLE}ClassifyCommand_0002 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0003
     * @tc.name      Socket_ClassifyCommand_0003
     * @tc.desc      classifyCommand(text="exit") returns SocketCommandKind.EXIT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL2
     */
    it('Socket_ClassifyCommand_0003', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0003 begin`);
      const actual: SocketCommandKind = classifyCommand('exit');
      logInfo(`classifyCommand(text="exit"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.EXIT);
      logInfo(`${BUNDLE}ClassifyCommand_0003 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0004
     * @tc.name      Socket_ClassifyCommand_0004
     * @tc.desc      classifyCommand(text="ONLINE") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0004', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0004 begin`);
      const actual: SocketCommandKind = classifyCommand('ONLINE');
      logInfo(`classifyCommand(text="ONLINE"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0004 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0005
     * @tc.name      Socket_ClassifyCommand_0005
     * @tc.desc      classifyCommand(text="") returns SocketCommandKind.UNKNOWN
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0005', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0005 begin`);
      const actual: SocketCommandKind = classifyCommand('');
      logInfo(`classifyCommand(text=""): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.UNKNOWN);
      logInfo(`${BUNDLE}ClassifyCommand_0005 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0006
     * @tc.name      Socket_ClassifyCommand_0006
     * @tc.desc      classifyCommand(text="onlin") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0006', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0006 begin`);
      const actual: SocketCommandKind = classifyCommand('onlin');
      logInfo(`classifyCommand(text="onlin"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0006 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0007
     * @tc.name      Socket_ClassifyCommand_0007
     * @tc.desc      classifyCommand(text="onlinex") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0007', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0007 begin`);
      const actual: SocketCommandKind = classifyCommand('onlinex');
      logInfo(`classifyCommand(text="onlinex"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0007 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0008
     * @tc.name      Socket_ClassifyCommand_0008
     * @tc.desc      classifyCommand(text="OFFLINE") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0008', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0008 begin`);
      const actual: SocketCommandKind = classifyCommand('OFFLINE');
      logInfo(`classifyCommand(text="OFFLINE"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0008 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0009
     * @tc.name      Socket_ClassifyCommand_0009
     * @tc.desc      classifyCommand(text="offlin") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0009', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0009 begin`);
      const actual: SocketCommandKind = classifyCommand('offlin');
      logInfo(`classifyCommand(text="offlin"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0009 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0010
     * @tc.name      Socket_ClassifyCommand_0010
     * @tc.desc      classifyCommand(text="offlinex") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0010', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0010 begin`);
      const actual: SocketCommandKind = classifyCommand('offlinex');
      logInfo(`classifyCommand(text="offlinex"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0010 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0011
     * @tc.name      Socket_ClassifyCommand_0011
     * @tc.desc      classifyCommand(text="EXIT") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0011', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0011 begin`);
      const actual: SocketCommandKind = classifyCommand('EXIT');
      logInfo(`classifyCommand(text="EXIT"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0011 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0012
     * @tc.name      Socket_ClassifyCommand_0012
     * @tc.desc      classifyCommand(text="exi") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0012', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0012 begin`);
      const actual: SocketCommandKind = classifyCommand('exi');
      logInfo(`classifyCommand(text="exi"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0012 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0013
     * @tc.name      Socket_ClassifyCommand_0013
     * @tc.desc      classifyCommand(text="exitx") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0013', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0013 begin`);
      const actual: SocketCommandKind = classifyCommand('exitx');
      logInfo(`classifyCommand(text="exitx"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0013 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0014
     * @tc.name      Socket_ClassifyCommand_0014
     * @tc.desc      classifyCommand(text="Hello") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0014', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0014 begin`);
      const actual: SocketCommandKind = classifyCommand('Hello');
      logInfo(`classifyCommand(text="Hello"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0014 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0015
     * @tc.name      Socket_ClassifyCommand_0015
     * @tc.desc      classifyCommand(text="hello world") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0015', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0015 begin`);
      const actual: SocketCommandKind = classifyCommand('hello world');
      logInfo(`classifyCommand(text="hello world"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0015 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0016
     * @tc.name      Socket_ClassifyCommand_0016
     * @tc.desc      classifyCommand(text=" ") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0016', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0016 begin`);
      const actual: SocketCommandKind = classifyCommand(' ');
      logInfo(`classifyCommand(text=" "): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0016 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0017
     * @tc.name      Socket_ClassifyCommand_0017
     * @tc.desc      classifyCommand(text="A") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0017', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0017 begin`);
      const actual: SocketCommandKind = classifyCommand('A');
      logInfo(`classifyCommand(text="A"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0017 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0018
     * @tc.name      Socket_ClassifyCommand_0018
     * @tc.desc      classifyCommand(text="Sample Title 123") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0018', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0018 begin`);
      const actual: SocketCommandKind = classifyCommand('Sample Title 123');
      logInfo(`classifyCommand(text="Sample Title 123"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0018 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0019
     * @tc.name      Socket_ClassifyCommand_0019
     * @tc.desc      classifyCommand(text="??") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0019', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0019 begin`);
      const actual: SocketCommandKind = classifyCommand('\u4e2d\u6587');
      logInfo(`classifyCommand(text="??"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0019 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0020
     * @tc.name      Socket_ClassifyCommand_0020
     * @tc.desc      classifyCommand(text="a") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0020', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0020 begin`);
      const actual: SocketCommandKind = classifyCommand('a');
      logInfo(`classifyCommand(text="a"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0020 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0021
     * @tc.name      Socket_ClassifyCommand_0021
     * @tc.desc      classifyCommand(text="abc") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0021', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0021 begin`);
      const actual: SocketCommandKind = classifyCommand('abc');
      logInfo(`classifyCommand(text="abc"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0021 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0022
     * @tc.name      Socket_ClassifyCommand_0022
     * @tc.desc      classifyCommand(text="Hello World") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0022', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0022 begin`);
      const actual: SocketCommandKind = classifyCommand('Hello World');
      logInfo(`classifyCommand(text="Hello World"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0022 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0023
     * @tc.name      Socket_ClassifyCommand_0023
     * @tc.desc      classifyCommand(text="123") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0023', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0023 begin`);
      const actual: SocketCommandKind = classifyCommand('123');
      logInfo(`classifyCommand(text="123"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0023 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0024
     * @tc.name      Socket_ClassifyCommand_0024
     * @tc.desc      classifyCommand(text=" online ") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0024', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0024 begin`);
      const actual: SocketCommandKind = classifyCommand(' online ');
      logInfo(`classifyCommand(text=" online "): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0024 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0025
     * @tc.name      Socket_ClassifyCommand_0025
     * @tc.desc      classifyCommand(text="onlineonline") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0025', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0025 begin`);
      const actual: SocketCommandKind = classifyCommand('onlineonline');
      logInfo(`classifyCommand(text="onlineonline"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0025 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0026
     * @tc.name      Socket_ClassifyCommand_0026
     * @tc.desc      classifyCommand(text="online_1") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0026', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0026 begin`);
      const actual: SocketCommandKind = classifyCommand('online_1');
      logInfo(`classifyCommand(text="online_1"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0026 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0027
     * @tc.name      Socket_ClassifyCommand_0027
     * @tc.desc      classifyCommand(text="xonline") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0027', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0027 begin`);
      const actual: SocketCommandKind = classifyCommand('xonline');
      logInfo(`classifyCommand(text="xonline"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0027 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0028
     * @tc.name      Socket_ClassifyCommand_0028
     * @tc.desc      classifyCommand(text=" offline ") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0028', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0028 begin`);
      const actual: SocketCommandKind = classifyCommand(' offline ');
      logInfo(`classifyCommand(text=" offline "): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0028 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0029
     * @tc.name      Socket_ClassifyCommand_0029
     * @tc.desc      classifyCommand(text="offlineoffline") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0029', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0029 begin`);
      const actual: SocketCommandKind = classifyCommand('offlineoffline');
      logInfo(`classifyCommand(text="offlineoffline"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0029 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0030
     * @tc.name      Socket_ClassifyCommand_0030
     * @tc.desc      classifyCommand(text="offline_1") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0030', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0030 begin`);
      const actual: SocketCommandKind = classifyCommand('offline_1');
      logInfo(`classifyCommand(text="offline_1"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0030 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0031
     * @tc.name      Socket_ClassifyCommand_0031
     * @tc.desc      classifyCommand(text="xoffline") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0031', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0031 begin`);
      const actual: SocketCommandKind = classifyCommand('xoffline');
      logInfo(`classifyCommand(text="xoffline"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0031 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0032
     * @tc.name      Socket_ClassifyCommand_0032
     * @tc.desc      classifyCommand(text=" exit ") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0032', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0032 begin`);
      const actual: SocketCommandKind = classifyCommand(' exit ');
      logInfo(`classifyCommand(text=" exit "): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0032 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0033
     * @tc.name      Socket_ClassifyCommand_0033
     * @tc.desc      classifyCommand(text="exitexit") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0033', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0033 begin`);
      const actual: SocketCommandKind = classifyCommand('exitexit');
      logInfo(`classifyCommand(text="exitexit"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0033 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0034
     * @tc.name      Socket_ClassifyCommand_0034
     * @tc.desc      classifyCommand(text="exit_1") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0034', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0034 begin`);
      const actual: SocketCommandKind = classifyCommand('exit_1');
      logInfo(`classifyCommand(text="exit_1"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0034 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0035
     * @tc.name      Socket_ClassifyCommand_0035
     * @tc.desc      classifyCommand(text="xexit") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0035', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0035 begin`);
      const actual: SocketCommandKind = classifyCommand('xexit');
      logInfo(`classifyCommand(text="xexit"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0035 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0036
     * @tc.name      Socket_ClassifyCommand_0036
     * @tc.desc      classifyCommand(text=" ONLINE ") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0036', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0036 begin`);
      const actual: SocketCommandKind = classifyCommand(' ONLINE ');
      logInfo(`classifyCommand(text=" ONLINE "): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0036 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0037
     * @tc.name      Socket_ClassifyCommand_0037
     * @tc.desc      classifyCommand(text="ONLINEONLINE") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0037', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0037 begin`);
      const actual: SocketCommandKind = classifyCommand('ONLINEONLINE');
      logInfo(`classifyCommand(text="ONLINEONLINE"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0037 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0038
     * @tc.name      Socket_ClassifyCommand_0038
     * @tc.desc      classifyCommand(text="ONLINE_1") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0038', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0038 begin`);
      const actual: SocketCommandKind = classifyCommand('ONLINE_1');
      logInfo(`classifyCommand(text="ONLINE_1"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0038 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0039
     * @tc.name      Socket_ClassifyCommand_0039
     * @tc.desc      classifyCommand(text="xONLINE") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0039', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0039 begin`);
      const actual: SocketCommandKind = classifyCommand('xONLINE');
      logInfo(`classifyCommand(text="xONLINE"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0039 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0040
     * @tc.name      Socket_ClassifyCommand_0040
     * @tc.desc      classifyCommand(text=" onlin ") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0040', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0040 begin`);
      const actual: SocketCommandKind = classifyCommand(' onlin ');
      logInfo(`classifyCommand(text=" onlin "): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0040 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0041
     * @tc.name      Socket_ClassifyCommand_0041
     * @tc.desc      classifyCommand(text="onlinonlin") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0041', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0041 begin`);
      const actual: SocketCommandKind = classifyCommand('onlinonlin');
      logInfo(`classifyCommand(text="onlinonlin"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0041 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0042
     * @tc.name      Socket_ClassifyCommand_0042
     * @tc.desc      classifyCommand(text="onlin_1") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0042', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0042 begin`);
      const actual: SocketCommandKind = classifyCommand('onlin_1');
      logInfo(`classifyCommand(text="onlin_1"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0042 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0043
     * @tc.name      Socket_ClassifyCommand_0043
     * @tc.desc      classifyCommand(text="xonlin") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0043', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0043 begin`);
      const actual: SocketCommandKind = classifyCommand('xonlin');
      logInfo(`classifyCommand(text="xonlin"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0043 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0044
     * @tc.name      Socket_ClassifyCommand_0044
     * @tc.desc      classifyCommand(text=" onlinex ") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0044', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0044 begin`);
      const actual: SocketCommandKind = classifyCommand(' onlinex ');
      logInfo(`classifyCommand(text=" onlinex "): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0044 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0045
     * @tc.name      Socket_ClassifyCommand_0045
     * @tc.desc      classifyCommand(text="onlinexonlinex") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0045', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0045 begin`);
      const actual: SocketCommandKind = classifyCommand('onlinexonlinex');
      logInfo(`classifyCommand(text="onlinexonlinex"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0045 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0046
     * @tc.name      Socket_ClassifyCommand_0046
     * @tc.desc      classifyCommand(text="onlinex_1") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0046', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0046 begin`);
      const actual: SocketCommandKind = classifyCommand('onlinex_1');
      logInfo(`classifyCommand(text="onlinex_1"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0046 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0047
     * @tc.name      Socket_ClassifyCommand_0047
     * @tc.desc      classifyCommand(text="xonlinex") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0047', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0047 begin`);
      const actual: SocketCommandKind = classifyCommand('xonlinex');
      logInfo(`classifyCommand(text="xonlinex"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0047 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0048
     * @tc.name      Socket_ClassifyCommand_0048
     * @tc.desc      classifyCommand(text=" OFFLINE ") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0048', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0048 begin`);
      const actual: SocketCommandKind = classifyCommand(' OFFLINE ');
      logInfo(`classifyCommand(text=" OFFLINE "): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0048 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0049
     * @tc.name      Socket_ClassifyCommand_0049
     * @tc.desc      classifyCommand(text="OFFLINEOFFLINE") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0049', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0049 begin`);
      const actual: SocketCommandKind = classifyCommand('OFFLINEOFFLINE');
      logInfo(`classifyCommand(text="OFFLINEOFFLINE"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0049 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0050
     * @tc.name      Socket_ClassifyCommand_0050
     * @tc.desc      classifyCommand(text="OFFLINE_1") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0050', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0050 begin`);
      const actual: SocketCommandKind = classifyCommand('OFFLINE_1');
      logInfo(`classifyCommand(text="OFFLINE_1"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0050 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0051
     * @tc.name      Socket_ClassifyCommand_0051
     * @tc.desc      classifyCommand(text="xOFFLINE") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0051', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0051 begin`);
      const actual: SocketCommandKind = classifyCommand('xOFFLINE');
      logInfo(`classifyCommand(text="xOFFLINE"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0051 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0052
     * @tc.name      Socket_ClassifyCommand_0052
     * @tc.desc      classifyCommand(text=" offlin ") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0052', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0052 begin`);
      const actual: SocketCommandKind = classifyCommand(' offlin ');
      logInfo(`classifyCommand(text=" offlin "): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0052 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0053
     * @tc.name      Socket_ClassifyCommand_0053
     * @tc.desc      classifyCommand(text="offlinofflin") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0053', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0053 begin`);
      const actual: SocketCommandKind = classifyCommand('offlinofflin');
      logInfo(`classifyCommand(text="offlinofflin"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0053 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0054
     * @tc.name      Socket_ClassifyCommand_0054
     * @tc.desc      classifyCommand(text="offlin_1") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0054', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0054 begin`);
      const actual: SocketCommandKind = classifyCommand('offlin_1');
      logInfo(`classifyCommand(text="offlin_1"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0054 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0055
     * @tc.name      Socket_ClassifyCommand_0055
     * @tc.desc      classifyCommand(text="xofflin") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0055', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0055 begin`);
      const actual: SocketCommandKind = classifyCommand('xofflin');
      logInfo(`classifyCommand(text="xofflin"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0055 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0056
     * @tc.name      Socket_ClassifyCommand_0056
     * @tc.desc      classifyCommand(text=" offlinex ") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0056', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0056 begin`);
      const actual: SocketCommandKind = classifyCommand(' offlinex ');
      logInfo(`classifyCommand(text=" offlinex "): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0056 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0057
     * @tc.name      Socket_ClassifyCommand_0057
     * @tc.desc      classifyCommand(text="offlinexofflinex") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0057', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0057 begin`);
      const actual: SocketCommandKind = classifyCommand('offlinexofflinex');
      logInfo(`classifyCommand(text="offlinexofflinex"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0057 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0058
     * @tc.name      Socket_ClassifyCommand_0058
     * @tc.desc      classifyCommand(text="offlinex_1") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0058', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0058 begin`);
      const actual: SocketCommandKind = classifyCommand('offlinex_1');
      logInfo(`classifyCommand(text="offlinex_1"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0058 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0059
     * @tc.name      Socket_ClassifyCommand_0059
     * @tc.desc      classifyCommand(text="xofflinex") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0059', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0059 begin`);
      const actual: SocketCommandKind = classifyCommand('xofflinex');
      logInfo(`classifyCommand(text="xofflinex"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0059 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0060
     * @tc.name      Socket_ClassifyCommand_0060
     * @tc.desc      classifyCommand(text=" EXIT ") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0060', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0060 begin`);
      const actual: SocketCommandKind = classifyCommand(' EXIT ');
      logInfo(`classifyCommand(text=" EXIT "): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0060 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0061
     * @tc.name      Socket_ClassifyCommand_0061
     * @tc.desc      classifyCommand(text="EXITEXIT") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0061', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0061 begin`);
      const actual: SocketCommandKind = classifyCommand('EXITEXIT');
      logInfo(`classifyCommand(text="EXITEXIT"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0061 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0062
     * @tc.name      Socket_ClassifyCommand_0062
     * @tc.desc      classifyCommand(text="EXIT_1") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0062', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0062 begin`);
      const actual: SocketCommandKind = classifyCommand('EXIT_1');
      logInfo(`classifyCommand(text="EXIT_1"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0062 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0063
     * @tc.name      Socket_ClassifyCommand_0063
     * @tc.desc      classifyCommand(text="xEXIT") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0063', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0063 begin`);
      const actual: SocketCommandKind = classifyCommand('xEXIT');
      logInfo(`classifyCommand(text="xEXIT"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0063 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0064
     * @tc.name      Socket_ClassifyCommand_0064
     * @tc.desc      classifyCommand(text=" exi ") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0064', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0064 begin`);
      const actual: SocketCommandKind = classifyCommand(' exi ');
      logInfo(`classifyCommand(text=" exi "): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0064 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0065
     * @tc.name      Socket_ClassifyCommand_0065
     * @tc.desc      classifyCommand(text="exiexi") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0065', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0065 begin`);
      const actual: SocketCommandKind = classifyCommand('exiexi');
      logInfo(`classifyCommand(text="exiexi"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0065 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0066
     * @tc.name      Socket_ClassifyCommand_0066
     * @tc.desc      classifyCommand(text="exi_1") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0066', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0066 begin`);
      const actual: SocketCommandKind = classifyCommand('exi_1');
      logInfo(`classifyCommand(text="exi_1"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0066 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0067
     * @tc.name      Socket_ClassifyCommand_0067
     * @tc.desc      classifyCommand(text="xexi") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0067', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0067 begin`);
      const actual: SocketCommandKind = classifyCommand('xexi');
      logInfo(`classifyCommand(text="xexi"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0067 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0068
     * @tc.name      Socket_ClassifyCommand_0068
     * @tc.desc      classifyCommand(text=" exitx ") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0068', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0068 begin`);
      const actual: SocketCommandKind = classifyCommand(' exitx ');
      logInfo(`classifyCommand(text=" exitx "): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0068 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0069
     * @tc.name      Socket_ClassifyCommand_0069
     * @tc.desc      classifyCommand(text="exitxexitx") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0069', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0069 begin`);
      const actual: SocketCommandKind = classifyCommand('exitxexitx');
      logInfo(`classifyCommand(text="exitxexitx"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0069 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0070
     * @tc.name      Socket_ClassifyCommand_0070
     * @tc.desc      classifyCommand(text="exitx_1") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0070', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0070 begin`);
      const actual: SocketCommandKind = classifyCommand('exitx_1');
      logInfo(`classifyCommand(text="exitx_1"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0070 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0071
     * @tc.name      Socket_ClassifyCommand_0071
     * @tc.desc      classifyCommand(text="xexitx") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL3
     */
    it('Socket_ClassifyCommand_0071', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0071 begin`);
      const actual: SocketCommandKind = classifyCommand('xexitx');
      logInfo(`classifyCommand(text="xexitx"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0071 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0072
     * @tc.name      Socket_ClassifyCommand_0072
     * @tc.desc      classifyCommand(text="VCvU") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0072', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0072 begin`);
      const actual: SocketCommandKind = classifyCommand('VCvU');
      logInfo(`classifyCommand(text="VCvU"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0072 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0073
     * @tc.name      Socket_ClassifyCommand_0073
     * @tc.desc      classifyCommand(text="aGFFEaYHJti") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0073', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0073 begin`);
      const actual: SocketCommandKind = classifyCommand('aGFFEaYHJti');
      logInfo(`classifyCommand(text="aGFFEaYHJti"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0073 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0074
     * @tc.name      Socket_ClassifyCommand_0074
     * @tc.desc      classifyCommand(text="iJr") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0074', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0074 begin`);
      const actual: SocketCommandKind = classifyCommand('iJr');
      logInfo(`classifyCommand(text="iJr"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0074 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0075
     * @tc.name      Socket_ClassifyCommand_0075
     * @tc.desc      classifyCommand(text="YNrQFVysRg") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0075', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0075 begin`);
      const actual: SocketCommandKind = classifyCommand('YNrQFVysRg');
      logInfo(`classifyCommand(text="YNrQFVysRg"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0075 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0076
     * @tc.name      Socket_ClassifyCommand_0076
     * @tc.desc      classifyCommand(text="BxAwzovZWs") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0076', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0076 begin`);
      const actual: SocketCommandKind = classifyCommand('BxAwzovZWs');
      logInfo(`classifyCommand(text="BxAwzovZWs"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0076 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0077
     * @tc.name      Socket_ClassifyCommand_0077
     * @tc.desc      classifyCommand(text="uWpalC4s8J") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0077', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0077 begin`);
      const actual: SocketCommandKind = classifyCommand('uWpalC4s8J');
      logInfo(`classifyCommand(text="uWpalC4s8J"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0077 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0078
     * @tc.name      Socket_ClassifyCommand_0078
     * @tc.desc      classifyCommand(text="UgWMpm6") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0078', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0078 begin`);
      const actual: SocketCommandKind = classifyCommand('UgWMpm6');
      logInfo(`classifyCommand(text="UgWMpm6"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0078 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0079
     * @tc.name      Socket_ClassifyCommand_0079
     * @tc.desc      classifyCommand(text="lg") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0079', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0079 begin`);
      const actual: SocketCommandKind = classifyCommand('lg');
      logInfo(`classifyCommand(text="lg"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0079 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0080
     * @tc.name      Socket_ClassifyCommand_0080
     * @tc.desc      classifyCommand(text="4JaT9") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0080', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0080 begin`);
      const actual: SocketCommandKind = classifyCommand('4JaT9');
      logInfo(`classifyCommand(text="4JaT9"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0080 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0081
     * @tc.name      Socket_ClassifyCommand_0081
     * @tc.desc      classifyCommand(text="VmIopCCE") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0081', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0081 begin`);
      const actual: SocketCommandKind = classifyCommand('VmIopCCE');
      logInfo(`classifyCommand(text="VmIopCCE"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0081 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0082
     * @tc.name      Socket_ClassifyCommand_0082
     * @tc.desc      classifyCommand(text="FZbOSVup7") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0082', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0082 begin`);
      const actual: SocketCommandKind = classifyCommand('FZbOSVup7');
      logInfo(`classifyCommand(text="FZbOSVup7"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0082 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0083
     * @tc.name      Socket_ClassifyCommand_0083
     * @tc.desc      classifyCommand(text="eZVH") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0083', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0083 begin`);
      const actual: SocketCommandKind = classifyCommand('eZVH');
      logInfo(`classifyCommand(text="eZVH"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0083 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0084
     * @tc.name      Socket_ClassifyCommand_0084
     * @tc.desc      classifyCommand(text="Zk3e4Ya1u9f2") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0084', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0084 begin`);
      const actual: SocketCommandKind = classifyCommand('Zk3e4Ya1u9f2');
      logInfo(`classifyCommand(text="Zk3e4Ya1u9f2"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0084 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0085
     * @tc.name      Socket_ClassifyCommand_0085
     * @tc.desc      classifyCommand(text="Mq") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0085', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0085 begin`);
      const actual: SocketCommandKind = classifyCommand('Mq');
      logInfo(`classifyCommand(text="Mq"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0085 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0086
     * @tc.name      Socket_ClassifyCommand_0086
     * @tc.desc      classifyCommand(text="Kbpp6ouzMwd9") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0086', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0086 begin`);
      const actual: SocketCommandKind = classifyCommand('Kbpp6ouzMwd9');
      logInfo(`classifyCommand(text="Kbpp6ouzMwd9"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0086 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0087
     * @tc.name      Socket_ClassifyCommand_0087
     * @tc.desc      classifyCommand(text="vGYJn") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0087', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0087 begin`);
      const actual: SocketCommandKind = classifyCommand('vGYJn');
      logInfo(`classifyCommand(text="vGYJn"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0087 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0088
     * @tc.name      Socket_ClassifyCommand_0088
     * @tc.desc      classifyCommand(text="JiTaUL") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0088', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0088 begin`);
      const actual: SocketCommandKind = classifyCommand('JiTaUL');
      logInfo(`classifyCommand(text="JiTaUL"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0088 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0089
     * @tc.name      Socket_ClassifyCommand_0089
     * @tc.desc      classifyCommand(text="s7kMdiPric") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0089', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0089 begin`);
      const actual: SocketCommandKind = classifyCommand('s7kMdiPric');
      logInfo(`classifyCommand(text="s7kMdiPric"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0089 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0090
     * @tc.name      Socket_ClassifyCommand_0090
     * @tc.desc      classifyCommand(text="mX") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0090', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0090 begin`);
      const actual: SocketCommandKind = classifyCommand('mX');
      logInfo(`classifyCommand(text="mX"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0090 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0091
     * @tc.name      Socket_ClassifyCommand_0091
     * @tc.desc      classifyCommand(text="uV") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0091', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0091 begin`);
      const actual: SocketCommandKind = classifyCommand('uV');
      logInfo(`classifyCommand(text="uV"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0091 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0092
     * @tc.name      Socket_ClassifyCommand_0092
     * @tc.desc      classifyCommand(text="LoNRYS") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0092', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0092 begin`);
      const actual: SocketCommandKind = classifyCommand('LoNRYS');
      logInfo(`classifyCommand(text="LoNRYS"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0092 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0093
     * @tc.name      Socket_ClassifyCommand_0093
     * @tc.desc      classifyCommand(text="Z") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0093', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0093 begin`);
      const actual: SocketCommandKind = classifyCommand('Z');
      logInfo(`classifyCommand(text="Z"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0093 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0094
     * @tc.name      Socket_ClassifyCommand_0094
     * @tc.desc      classifyCommand(text="5uu") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0094', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0094 begin`);
      const actual: SocketCommandKind = classifyCommand('5uu');
      logInfo(`classifyCommand(text="5uu"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0094 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0095
     * @tc.name      Socket_ClassifyCommand_0095
     * @tc.desc      classifyCommand(text="qh8vc") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0095', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0095 begin`);
      const actual: SocketCommandKind = classifyCommand('qh8vc');
      logInfo(`classifyCommand(text="qh8vc"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0095 end`);
    });

    /**
     * @tc.number    SUB_SOCKET_CLASSIFY_COMMAND_0096
     * @tc.name      Socket_ClassifyCommand_0096
     * @tc.desc      classifyCommand(text="uCCiFgzINtt") returns SocketCommandKind.CHAT
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL1
     */
    it('Socket_ClassifyCommand_0096', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      logInfo(`${BUNDLE}ClassifyCommand_0096 begin`);
      const actual: SocketCommandKind = classifyCommand('uCCiFgzINtt');
      logInfo(`classifyCommand(text="uCCiFgzINtt"): actual=${actual}`);
      expect(actual).assertEqual(SocketCommandKind.CHAT);
      logInfo(`${BUNDLE}ClassifyCommand_0096 end`);
    });
  });
}
