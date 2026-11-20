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
import { ChatSource } from '../../../main/ets/model/DataSource';
import { ChatBox } from '../../../main/ets/model/ChatBox';

const DOMAIN: number = 0xF814;
const TAG: string = 'ChatSourceCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

function box(message: string): ChatBox {
  return new ChatBox(true, message, '7.1-9:0');
}

export default function chatSourceCoreTest(): void {
  describe('SocketChatSourceCoreTest', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_SOCKET_DATASRC_0201
     * @tc.name      testChatSource0201
     * @tc.desc      Verify a fresh chat source reports zero total count.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatSource0201', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatSource0201 begin');
      const source: ChatSource = new ChatSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=0`);
      expect(source.totalCount()).assertEqual(0);
      log('testChatSource0201 end');
    })

    /**
     * @tc.number    SUB_SOCKET_DATASRC_0202
     * @tc.name      testChatSource0202
     * @tc.desc      Verify totalCount keeps the number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatSource0202', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatSource0202 begin');
      const source: ChatSource = new ChatSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof source.totalCount()=${typeof source.totalCount()}`);
      expect(typeof source.totalCount()).assertEqual('number');
      log('testChatSource0202 end');
    })

    /**
     * @tc.number    SUB_SOCKET_DATASRC_0203
     * @tc.name      testChatSource0203
     * @tc.desc      Verify getData(0) on an empty source is undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatSource0203', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatSource0203 begin');
      const source: ChatSource = new ChatSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(0)`);
      expect(source.getData(0)).assertUndefined();
      log('testChatSource0203 end');
    })

    /**
     * @tc.number    SUB_SOCKET_DATASRC_0204
     * @tc.name      testChatSource0204
     * @tc.desc      Verify getData(-1) on an empty source is undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatSource0204', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatSource0204 begin');
      const source: ChatSource = new ChatSource();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(-1)`);
      expect(source.getData(-1)).assertUndefined();
      log('testChatSource0204 end');
    })

    /**
     * @tc.number    SUB_SOCKET_DATASRC_0205
     * @tc.name      testChatSource0205
     * @tc.desc      Verify an out of range index reads undefined.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatSource0205', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatSource0205 begin');
      const source: ChatSource = new ChatSource();
      source.pushData(box('only'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertUndefined source.getData(5)`);
      expect(source.getData(5)).assertUndefined();
      log('testChatSource0205 end');
    })

    /**
     * @tc.number    SUB_SOCKET_DATASRC_0206
     * @tc.name      testChatSource0206
     * @tc.desc      Verify pushing one item raises the count to one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatSource0206', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatSource0206 begin');
      const source: ChatSource = new ChatSource();
      source.pushData(box('first'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=1`);
      expect(source.totalCount()).assertEqual(1);
      log('testChatSource0206 end');
    })

    /**
     * @tc.number    SUB_SOCKET_DATASRC_0207
     * @tc.name      testChatSource0207
     * @tc.desc      Verify getData(0) returns the pushed message text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatSource0207', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatSource0207 begin');
      const source: ChatSource = new ChatSource();
      source.pushData(box('payload'));
      const item: ChatBox = source.getData(0) as ChatBox;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.message=${item.message}, expected='payload'`);
      expect(item.message).assertEqual('payload');
      log('testChatSource0207 end');
    })

    /**
     * @tc.number    SUB_SOCKET_DATASRC_0208
     * @tc.name      testChatSource0208
     * @tc.desc      Verify getData(0) preserves the isSend flag.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatSource0208', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatSource0208 begin');
      const source: ChatSource = new ChatSource();
      source.pushData(new ChatBox(false, 'r', '7.2-9:0'));
      const item: ChatBox = source.getData(0) as ChatBox;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse item.isSend=${item.isSend}`);
      expect(item.isSend).assertFalse();
      log('testChatSource0208 end');
    })

    /**
     * @tc.number    SUB_SOCKET_DATASRC_0209
     * @tc.name      testChatSource0209
     * @tc.desc      Verify getData(0) preserves the date label.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatSource0209', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatSource0209 begin');
      const source: ChatSource = new ChatSource();
      source.pushData(new ChatBox(true, 'm', '7.3-9:0'));
      const item: ChatBox = source.getData(0) as ChatBox;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.date=${item.date}, expected='7.3-9:0'`);
      expect(item.date).assertEqual('7.3-9:0');
      log('testChatSource0209 end');
    })

    /**
     * @tc.number    SUB_SOCKET_DATASRC_0210
     * @tc.name      testChatSource0210
     * @tc.desc      Verify pushing three items raises the count to three.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatSource0210', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatSource0210 begin');
      const source: ChatSource = new ChatSource();
      source.pushData(box('a'));
      source.pushData(box('b'));
      source.pushData(box('c'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=3`);
      expect(source.totalCount()).assertEqual(3);
      log('testChatSource0210 end');
    })

    /**
     * @tc.number    SUB_SOCKET_DATASRC_0211
     * @tc.name      testChatSource0211
     * @tc.desc      Verify pushed items keep their insertion order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatSource0211', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatSource0211 begin');
      const source: ChatSource = new ChatSource();
      source.pushData(box('a'));
      source.pushData(box('b'));
      source.pushData(box('c'));
      const second: ChatBox = source.getData(1) as ChatBox;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.message=${second.message}, expected='b'`);
      expect(second.message).assertEqual('b');
      log('testChatSource0211 end');
    })

    /**
     * @tc.number    SUB_SOCKET_DATASRC_0212
     * @tc.name      testChatSource0212
     * @tc.desc      Verify the last pushed item sits at the last index.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatSource0212', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatSource0212 begin');
      const source: ChatSource = new ChatSource();
      source.pushData(box('a'));
      source.pushData(box('b'));
      source.pushData(box('c'));
      const last: ChatBox = source.getData(2) as ChatBox;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual last.message=${last.message}, expected='c'`);
      expect(last.message).assertEqual('c');
      log('testChatSource0212 end');
    })

    /**
     * @tc.number    SUB_SOCKET_DATASRC_0213
     * @tc.name      testChatSource0213
     * @tc.desc      Verify getData and chatsArray expose the same element.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatSource0213', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatSource0213 begin');
      const source: ChatSource = new ChatSource();
      source.pushData(box('same'));
      const viaGetter: ChatBox = source.getData(0) as ChatBox;
      const viaArray: ChatBox = source.chatsArray[0];
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual viaGetter.message=${viaGetter.message}`);
      expect(viaGetter.message).assertEqual(viaArray.message);
      log('testChatSource0213 end');
    })

    /**
     * @tc.number    SUB_SOCKET_DATASRC_0214
     * @tc.name      testChatSource0214
     * @tc.desc      Verify chatsArray length matches totalCount after pushes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatSource0214', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatSource0214 begin');
      const source: ChatSource = new ChatSource();
      source.pushData(box('a'));
      source.pushData(box('b'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.chatsArray.length=${source.chatsArray.length}`);
      expect(source.chatsArray.length).assertEqual(source.totalCount());
      log('testChatSource0214 end');
    })

    /**
     * @tc.number    SUB_SOCKET_DATASRC_0215
     * @tc.name      testChatSource0215
     * @tc.desc      Verify addData(0) inserts a new item at the head.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatSource0215', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatSource0215 begin');
      const source: ChatSource = new ChatSource();
      source.pushData(box('old'));
      source.addData(0, box('new'));
      const head: ChatBox = source.getData(0) as ChatBox;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual head.message=${head.message}, expected='new'`);
      expect(head.message).assertEqual('new');
      log('testChatSource0215 end');
    })

    /**
     * @tc.number    SUB_SOCKET_DATASRC_0216
     * @tc.name      testChatSource0216
     * @tc.desc      Verify the previous head moves to index one after head insert.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatSource0216', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatSource0216 begin');
      const source: ChatSource = new ChatSource();
      source.pushData(box('old'));
      source.addData(0, box('new'));
      const second: ChatBox = source.getData(1) as ChatBox;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual second.message=${second.message}, expected='old'`);
      expect(second.message).assertEqual('old');
      log('testChatSource0216 end');
    })

    /**
     * @tc.number    SUB_SOCKET_DATASRC_0217
     * @tc.name      testChatSource0217
     * @tc.desc      Verify addData raises the count by exactly one.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatSource0217', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatSource0217 begin');
      const source: ChatSource = new ChatSource();
      source.pushData(box('a'));
      source.addData(0, box('b'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=2`);
      expect(source.totalCount()).assertEqual(2);
      log('testChatSource0217 end');
    })

    /**
     * @tc.number    SUB_SOCKET_DATASRC_0218
     * @tc.name      testChatSource0218
     * @tc.desc      Verify addData(1) inserts into the middle position.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatSource0218', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatSource0218 begin');
      const source: ChatSource = new ChatSource();
      source.pushData(box('a'));
      source.pushData(box('c'));
      source.addData(1, box('b'));
      const middle: ChatBox = source.getData(1) as ChatBox;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual middle.message=${middle.message}, expected='b'`);
      expect(middle.message).assertEqual('b');
      log('testChatSource0218 end');
    })

    /**
     * @tc.number    SUB_SOCKET_DATASRC_0219
     * @tc.name      testChatSource0219
     * @tc.desc      Verify addData at the tail index appends like a push.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatSource0219', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatSource0219 begin');
      const source: ChatSource = new ChatSource();
      source.pushData(box('a'));
      source.addData(1, box('tail'));
      const last: ChatBox = source.getData(1) as ChatBox;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual last.message=${last.message}, expected='tail'`);
      expect(last.message).assertEqual('tail');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=2`);
      expect(source.totalCount()).assertEqual(2);
      log('testChatSource0219 end');
    })

    /**
     * @tc.number    SUB_SOCKET_DATASRC_0220
     * @tc.name      testChatSource0220
     * @tc.desc      Verify the full order after a head insert stays correct.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatSource0220', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatSource0220 begin');
      const source: ChatSource = new ChatSource();
      source.pushData(box('b'));
      source.pushData(box('c'));
      source.addData(0, box('a'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${(source.getData(0) as ChatBox).message}`);
      expect((source.getData(0) as ChatBox).message).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${(source.getData(1) as ChatBox).message}`);
      expect((source.getData(1) as ChatBox).message).assertEqual('b');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${(source.getData(2) as ChatBox).message}`);
      expect((source.getData(2) as ChatBox).message).assertEqual('c');
      log('testChatSource0220 end');
    })

    /**
     * @tc.number    SUB_SOCKET_DATASRC_0221
     * @tc.name      testChatSource0221
     * @tc.desc      Verify ten pushes raise the count to exactly ten.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatSource0221', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatSource0221 begin');
      const source: ChatSource = new ChatSource();
      for (let i: number = 0; i < 10; i++) {
        source.pushData(box('m' + i));
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=10`);
      expect(source.totalCount()).assertEqual(10);
      log('testChatSource0221 end');
    })

    /**
     * @tc.number    SUB_SOCKET_DATASRC_0222
     * @tc.name      testChatSource0222
     * @tc.desc      Verify ten pushes read back in insertion order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatSource0222', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatSource0222 begin');
      const source: ChatSource = new ChatSource();
      for (let i: number = 0; i < 10; i++) {
        source.pushData(box('m' + i));
      }
      let orderOk: boolean = true;
      for (let i: number = 0; i < 10; i++) {
        const item: ChatBox = source.getData(i) as ChatBox;
        if (item.message !== 'm' + i) {
          orderOk = false;
        }
      }
      hilog.info(DOMAIN, TAG, '%{public}s', `assertTrue orderOk=${orderOk}`);
      expect(orderOk).assertTrue();
      log('testChatSource0222 end');
    })

    /**
     * @tc.number    SUB_SOCKET_DATASRC_0223
     * @tc.name      testChatSource0223
     * @tc.desc      Verify mixing addData before pushData keeps order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatSource0223', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatSource0223 begin');
      const source: ChatSource = new ChatSource();
      source.addData(0, box('a'));
      source.pushData(box('b'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${(source.getData(0) as ChatBox).message}`);
      expect((source.getData(0) as ChatBox).message).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${(source.getData(1) as ChatBox).message}`);
      expect((source.getData(1) as ChatBox).message).assertEqual('b');
      log('testChatSource0223 end');
    })

    /**
     * @tc.number    SUB_SOCKET_DATASRC_0224
     * @tc.name      testChatSource0224
     * @tc.desc      Verify mixing pushData before addData keeps order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatSource0224', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatSource0224 begin');
      const source: ChatSource = new ChatSource();
      source.pushData(box('b'));
      source.addData(0, box('a'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${(source.getData(0) as ChatBox).message}`);
      expect((source.getData(0) as ChatBox).message).assertEqual('a');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${(source.getData(1) as ChatBox).message}`);
      expect((source.getData(1) as ChatBox).message).assertEqual('b');
      log('testChatSource0224 end');
    })

    /**
     * @tc.number    SUB_SOCKET_DATASRC_0225
     * @tc.name      testChatSource0225
     * @tc.desc      Verify a fetched item exposes a string message field.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatSource0225', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatSource0225 begin');
      const source: ChatSource = new ChatSource();
      source.pushData(box('typed'));
      const item: ChatBox = source.getData(0) as ChatBox;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof item.message=${typeof item.message}`);
      expect(typeof item.message).assertEqual('string');
      log('testChatSource0225 end');
    })

    /**
     * @tc.number    SUB_SOCKET_DATASRC_0226
     * @tc.name      testChatSource0226
     * @tc.desc      Verify pushing the same instance twice stores two entries.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatSource0226', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatSource0226 begin');
      const source: ChatSource = new ChatSource();
      const shared: ChatBox = box('dup');
      source.pushData(shared);
      source.pushData(shared);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=2`);
      expect(source.totalCount()).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${(source.getData(1) as ChatBox).message}`);
      expect((source.getData(1) as ChatBox).message).assertEqual('dup');
      log('testChatSource0226 end');
    })

    /**
     * @tc.number    SUB_SOCKET_DATASRC_0227
     * @tc.name      testChatSource0227
     * @tc.desc      Verify an empty message round-trips through the source.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatSource0227', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatSource0227 begin');
      const source: ChatSource = new ChatSource();
      source.pushData(box(''));
      const item: ChatBox = source.getData(0) as ChatBox;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.message=${item.message}, expected=''`);
      expect(item.message).assertEqual('');
      log('testChatSource0227 end');
    })

    /**
     * @tc.number    SUB_SOCKET_DATASRC_0228
     * @tc.name      testChatSource0228
     * @tc.desc      Verify an oversized index appends to the tail gracefully.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatSource0228', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatSource0228 begin');
      const source: ChatSource = new ChatSource();
      source.pushData(box('a'));
      source.addData(100, box('far'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual source.totalCount()=${source.totalCount()}, expected=2`);
      expect(source.totalCount()).assertEqual(2);
      const last: ChatBox = source.getData(1) as ChatBox;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual last.message=${last.message}, expected='far'`);
      expect(last.message).assertEqual('far');
      log('testChatSource0228 end');
    })

    /**
     * @tc.number    SUB_SOCKET_DATASRC_0229
     * @tc.name      testChatSource0229
     * @tc.desc      Verify two consecutive head inserts reverse the order.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatSource0229', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatSource0229 begin');
      const source: ChatSource = new ChatSource();
      source.addData(0, box('first'));
      source.addData(0, box('second'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${(source.getData(0) as ChatBox).message}`);
      expect((source.getData(0) as ChatBox).message).assertEqual('second');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual actual=${(source.getData(1) as ChatBox).message}`);
      expect((source.getData(1) as ChatBox).message).assertEqual('first');
      log('testChatSource0229 end');
    })

    /**
     * @tc.number    SUB_SOCKET_DATASRC_0230
     * @tc.name      testChatSource0230
     * @tc.desc      Verify a received box round-trips with isSend false.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testChatSource0230', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testChatSource0230 begin');
      const source: ChatSource = new ChatSource();
      source.pushData(new ChatBox(false, 'incoming', '7.4-9:0'));
      const item: ChatBox = source.getData(0) as ChatBox;
      hilog.info(DOMAIN, TAG, '%{public}s', `assertFalse item.isSend=${item.isSend}`);
      expect(item.isSend).assertFalse();
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual item.message=${item.message}, expected='incoming'`);
      expect(item.message).assertEqual('incoming');
      log('testChatSource0230 end');
    })
  })
}
