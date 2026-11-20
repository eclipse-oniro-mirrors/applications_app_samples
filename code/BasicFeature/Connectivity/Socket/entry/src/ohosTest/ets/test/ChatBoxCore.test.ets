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
import { beforeEach, describe, it, expect, Level, Size, TestType } from '@ohos/hypium';
import { yieldToEventLoop } from './EventLoopYield';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { ChatBox } from '../../../main/ets/model/ChatBox';

const DOMAIN: number = 0xF814;
const TAG: string = 'ChatBoxCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function chatBoxCoreTest(): void {
  describe('SocketChatBoxCoreTest', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_SOCKET_CHATBOX_0101
     * @tc.name      testChatBox0101
     * @tc.desc      Verify a sent chat box keeps the provided message text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatBox0101', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatBox0101 begin');
      const box: ChatBox = new ChatBox(true, 'hello', '1.1-10:0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual box.message=${box.message}, expected='hello'`);
      expect(box.message).assertEqual('hello');
      log('testChatBox0101 end');
    })

    /**
     * @tc.number    SUB_SOCKET_CHATBOX_0102
     * @tc.name      testChatBox0102
     * @tc.desc      Verify a received chat box keeps the provided message text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatBox0102', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatBox0102 begin');
      const box: ChatBox = new ChatBox(false, 'reply', '1.1-10:1');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual box.message=${box.message}, expected='reply'`);
      expect(box.message).assertEqual('reply');
      log('testChatBox0102 end');
    })

    /**
     * @tc.number    SUB_SOCKET_CHATBOX_0103
     * @tc.name      testChatBox0103
     * @tc.desc      Verify isSend keeps the boolean type after construction.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatBox0103', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatBox0103 begin');
      const box: ChatBox = new ChatBox(true, 'a', 'd');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof box.isSend=${typeof box.isSend}, expected='boolean'`);
      expect(typeof box.isSend).assertEqual('boolean');
      log('testChatBox0103 end');
    })

    /**
     * @tc.number    SUB_SOCKET_CHATBOX_0104
     * @tc.name      testChatBox0104
     * @tc.desc      Verify message keeps the string type after construction.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatBox0104', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatBox0104 begin');
      const box: ChatBox = new ChatBox(true, 'a', 'd');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof box.message=${typeof box.message}, expected='string'`);
      expect(typeof box.message).assertEqual('string');
      log('testChatBox0104 end');
    })

    /**
     * @tc.number    SUB_SOCKET_CHATBOX_0105
     * @tc.name      testChatBox0105
     * @tc.desc      Verify date keeps the string type after construction.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatBox0105', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatBox0105 begin');
      const box: ChatBox = new ChatBox(true, 'a', 'd');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof box.date=${typeof box.date}, expected='string'`);
      expect(typeof box.date).assertEqual('string');
      log('testChatBox0105 end');
    })

    /**
     * @tc.number    SUB_SOCKET_CHATBOX_0106
     * @tc.name      testChatBox0106
     * @tc.desc      Verify an empty message is stored verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatBox0106', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatBox0106 begin');
      const box: ChatBox = new ChatBox(true, '', '1.1-0:0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual box.message=${box.message}, expected=''`);
      expect(box.message).assertEqual('');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual box.message.length=${box.message.length}, expected=0`);
      expect(box.message.length).assertEqual(0);
      log('testChatBox0106 end');
    })

    /**
     * @tc.number    SUB_SOCKET_CHATBOX_0107
     * @tc.name      testChatBox0107
     * @tc.desc      Verify a Chinese message is stored verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatBox0107', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatBox0107 begin');
      const box: ChatBox = new ChatBox(false, '你好，世界', '1.2-8:30');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual box.message=${box.message}, expected='你好，世界'`);
      expect(box.message).assertEqual('你好，世界');
      log('testChatBox0107 end');
    })

    /**
     * @tc.number    SUB_SOCKET_CHATBOX_0108
     * @tc.name      testChatBox0108
     * @tc.desc      Verify an emoji message is stored verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatBox0108', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatBox0108 begin');
      const box: ChatBox = new ChatBox(true, '😊🎉', '1.3-9:0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual box.message=${box.message}, expected='😊🎉'`);
      expect(box.message).assertEqual('😊🎉');
      log('testChatBox0108 end');
    })

    /**
     * @tc.number    SUB_SOCKET_CHATBOX_0109
     * @tc.name      testChatBox0109
     * @tc.desc      Verify a multiline message keeps the newline characters.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatBox0109', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatBox0109 begin');
      const box: ChatBox = new ChatBox(true, 'line1\nline2', '1.4-9:0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual box.message=${box.message}, expected='line1/nline2'`);
      expect(box.message).assertEqual('line1\nline2');
      log('testChatBox0109 end');
    })

    /**
     * @tc.number    SUB_SOCKET_CHATBOX_0110
     * @tc.name      testChatBox0110
     * @tc.desc      Verify a message containing a tab is stored verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatBox0110', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatBox0110 begin');
      const box: ChatBox = new ChatBox(true, 'a\tb', '1.5-9:0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual box.message=${box.message}, expected='a/tb'`);
      expect(box.message).assertEqual('a\tb');
      log('testChatBox0110 end');
    })

    /**
     * @tc.number    SUB_SOCKET_CHATBOX_0111
     * @tc.name      testChatBox0111
     * @tc.desc      Verify leading and trailing spaces are not trimmed away.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatBox0111', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatBox0111 begin');
      const box: ChatBox = new ChatBox(true, ' padded ', '1.6-9:0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual box.message=${box.message}, expected=' padded '`);
      expect(box.message).assertEqual(' padded ');
      log('testChatBox0111 end');
    })

    /**
     * @tc.number    SUB_SOCKET_CHATBOX_0112
     * @tc.name      testChatBox0112
     * @tc.desc      Verify a 1000 character message is stored in full.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatBox0112', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatBox0112 begin');
      const longText: string = 'a'.repeat(1000);
      const box: ChatBox = new ChatBox(true, longText, '1.7-9:0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual box.message=${box.message}, expected=longText`);
      expect(box.message).assertEqual(longText);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual box.message.length=${box.message.length}, expected=1000`);
      expect(box.message.length).assertEqual(1000);
      log('testChatBox0112 end');
    })

    /**
     * @tc.number    SUB_SOCKET_CHATBOX_0113
     * @tc.name      testChatBox0113
     * @tc.desc      Verify a JSON-like message is stored verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatBox0113', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatBox0113 begin');
      const box: ChatBox = new ChatBox(true, '{"a":1,"b":[2,3]}', '1.8-9:0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual box.message=${box.message}, expected='{"a":1,"b":[2,3]}'`);
      expect(box.message).assertEqual('{"a":1,"b":[2,3]}');
      log('testChatBox0113 end');
    })

    /**
     * @tc.number    SUB_SOCKET_CHATBOX_0114
     * @tc.name      testChatBox0114
     * @tc.desc      Verify a numeric message stays a string value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatBox0114', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatBox0114 begin');
      const box: ChatBox = new ChatBox(true, '12345', '1.9-9:0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual box.message=${box.message}, expected='12345'`);
      expect(box.message).assertEqual('12345');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof box.message=${typeof box.message}, expected='string'`);
      expect(typeof box.message).assertEqual('string');
      log('testChatBox0114 end');
    })

    /**
     * @tc.number    SUB_SOCKET_CHATBOX_0115
     * @tc.name      testChatBox0115
     * @tc.desc      Verify the control word online is stored as plain payload.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatBox0115', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatBox0115 begin');
      const box: ChatBox = new ChatBox(false, 'online', '2.1-9:0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual box.message=${box.message}, expected='online'`);
      expect(box.message).assertEqual('online');
      log('testChatBox0115 end');
    })

    /**
     * @tc.number    SUB_SOCKET_CHATBOX_0116
     * @tc.name      testChatBox0116
     * @tc.desc      Verify the control word exit is stored as plain payload.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatBox0116', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatBox0116 begin');
      const box: ChatBox = new ChatBox(false, 'exit', '2.2-9:0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual box.message=${box.message}, expected='exit'`);
      expect(box.message).assertEqual('exit');
      log('testChatBox0116 end');
    })

    /**
     * @tc.number    SUB_SOCKET_CHATBOX_0117
     * @tc.name      testChatBox0117
     * @tc.desc      Verify a short date string is stored verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatBox0117', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatBox0117 begin');
      const box: ChatBox = new ChatBox(true, 'm', '1.1-0:0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual box.date=${box.date}, expected='1.1-0:0'`);
      expect(box.date).assertEqual('1.1-0:0');
      log('testChatBox0117 end');
    })

    /**
     * @tc.number    SUB_SOCKET_CHATBOX_0118
     * @tc.name      testChatBox0118
     * @tc.desc      Verify a late night date string is stored verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatBox0118', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatBox0118 begin');
      const box: ChatBox = new ChatBox(true, 'm', '12.31-23:59');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual box.date=${box.date}, expected='12.31-23:59'`);
      expect(box.date).assertEqual('12.31-23:59');
      log('testChatBox0118 end');
    })

    /**
     * @tc.number    SUB_SOCKET_CHATBOX_0119
     * @tc.name      testChatBox0119
     * @tc.desc      Verify an empty date string is stored verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatBox0119', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatBox0119 begin');
      const box: ChatBox = new ChatBox(true, 'm', '');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual box.date=${box.date}, expected=''`);
      expect(box.date).assertEqual('');
      log('testChatBox0119 end');
    })

    /**
     * @tc.number    SUB_SOCKET_CHATBOX_0120
     * @tc.name      testChatBox0120
     * @tc.desc      Verify a Chinese date label is stored verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatBox0120', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatBox0120 begin');
      const box: ChatBox = new ChatBox(true, 'm', '一月一日');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual box.date=${box.date}, expected='一月一日'`);
      expect(box.date).assertEqual('一月一日');
      log('testChatBox0120 end');
    })

    /**
     * @tc.number    SUB_SOCKET_CHATBOX_0121
     * @tc.name      testChatBox0121
     * @tc.desc      Verify the message field is mutable after construction.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatBox0121', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatBox0121 begin');
      const box: ChatBox = new ChatBox(true, 'old', '3.1-9:0');
      box.message = 'new';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual box.message=${box.message}, expected='new'`);
      expect(box.message).assertEqual('new');
      log('testChatBox0121 end');
    })

    /**
     * @tc.number    SUB_SOCKET_CHATBOX_0122
     * @tc.name      testChatBox0122
     * @tc.desc      Verify the isSend field can be flipped after construction.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatBox0122', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatBox0122 begin');
      const box: ChatBox = new ChatBox(true, 'm', '3.2-9:0');
      box.isSend = false;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse box.isSend=${box.isSend}`);
      expect(box.isSend).assertFalse();
      log('testChatBox0122 end');
    })

    /**
     * @tc.number    SUB_SOCKET_CHATBOX_0123
     * @tc.name      testChatBox0123
     * @tc.desc      Verify the date field is mutable after construction.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatBox0123', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatBox0123 begin');
      const box: ChatBox = new ChatBox(true, 'm', '3.3-9:0');
      box.date = '3.4-9:0';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual box.date=${box.date}, expected='3.4-9:0'`);
      expect(box.date).assertEqual('3.4-9:0');
      log('testChatBox0123 end');
    })

    /**
     * @tc.number    SUB_SOCKET_CHATBOX_0124
     * @tc.name      testChatBox0124
     * @tc.desc      Verify two instances constructed alike stay independent.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatBox0124', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatBox0124 begin');
      const first: ChatBox = new ChatBox(true, 'same', '4.1-9:0');
      const second: ChatBox = new ChatBox(true, 'same', '4.1-9:0');
      first.message = 'changed';
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.message=${first.message}, expected='changed'`);
      expect(first.message).assertEqual('changed');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.message=${second.message}, expected='same'`);
      expect(second.message).assertEqual('same');
      log('testChatBox0124 end');
    })

    /**
     * @tc.number    SUB_SOCKET_CHATBOX_0125
     * @tc.name      testChatBox0125
     * @tc.desc      Verify two instances with different data keep their own values.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatBox0125', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatBox0125 begin');
      const first: ChatBox = new ChatBox(true, 'first', '4.2-9:0');
      const second: ChatBox = new ChatBox(false, 'second', '4.3-9:0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.message=${first.message}, expected='first'`);
      expect(first.message).assertEqual('first');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.message=${second.message}, expected='second'`);
      expect(second.message).assertEqual('second');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue first.isSend=${first.isSend}`);
      expect(first.isSend).assertTrue();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse second.isSend=${second.isSend}`);
      expect(second.isSend).assertFalse();
      log('testChatBox0125 end');
    })

    /**
     * @tc.number    SUB_SOCKET_CHATBOX_0126
     * @tc.name      testChatBox0126
     * @tc.desc      Verify quotes and backslashes survive inside a message.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatBox0126', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatBox0126 begin');
      const box: ChatBox = new ChatBox(true, 'a"b\\c', '5.1-9:0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual box.message=${box.message}, expected='a"b//c'`);
      expect(box.message).assertEqual('a"b\\c');
      log('testChatBox0126 end');
    })

    /**
     * @tc.number    SUB_SOCKET_CHATBOX_0127
     * @tc.name      testChatBox0127
     * @tc.desc      Verify full width punctuation is stored verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatBox0127', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatBox0127 begin');
      const box: ChatBox = new ChatBox(true, '；：（）！', '5.2-9:0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual box.message=${box.message}, expected='；：（）！'`);
      expect(box.message).assertEqual('；：（）！');
      log('testChatBox0127 end');
    })

    /**
     * @tc.number    SUB_SOCKET_CHATBOX_0128
     * @tc.name      testChatBox0128
     * @tc.desc      Verify flipping isSend twice restores the original value.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatBox0128', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatBox0128 begin');
      const box: ChatBox = new ChatBox(true, 'm', '5.3-9:0');
      box.isSend = !box.isSend;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse box.isSend=${box.isSend}`);
      expect(box.isSend).assertFalse();
      box.isSend = !box.isSend;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue box.isSend=${box.isSend}`);
      expect(box.isSend).assertTrue();
      log('testChatBox0128 end');
    })

    /**
     * @tc.number    SUB_SOCKET_CHATBOX_0129
     * @tc.name      testChatBox0129
     * @tc.desc      Verify a mixed script message is stored verbatim.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatBox0129', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatBox0129 begin');
      const box: ChatBox = new ChatBox(true, 'Hi你好こんにちは', '5.4-9:0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual box.message=${box.message}, expected='Hi你好こんにちは'`);
      expect(box.message).assertEqual('Hi你好こんにちは');
      log('testChatBox0129 end');
    })

    /**
     * @tc.number    SUB_SOCKET_CHATBOX_0130
     * @tc.name      testChatBox0130
     * @tc.desc      Verify three instances keep three distinct payloads.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatBox0130', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatBox0130 begin');
      const first: ChatBox = new ChatBox(true, 'one', '6.1-9:0');
      const second: ChatBox = new ChatBox(false, 'two', '6.2-9:0');
      const third: ChatBox = new ChatBox(true, 'three', '6.3-9:0');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual first.message=${first.message}, expected='one'`);
      expect(first.message).assertEqual('one');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.message=${second.message}, expected='two'`);
      expect(second.message).assertEqual('two');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual third.message=${third.message}, expected='three'`);
      expect(third.message).assertEqual('three');
      log('testChatBox0130 end');
    })
  })
}
