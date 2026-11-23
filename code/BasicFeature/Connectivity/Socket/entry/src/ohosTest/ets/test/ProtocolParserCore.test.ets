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
import { SocketCommandKind, classifyCommand, parseCommandFrame, encodeCommandFrame } from './SocketCommandParser';

const DOMAIN: number = 0xF814;
const TAG: string = 'ProtocolCoreTest';

function log(message: string): void {
  hilog.info(DOMAIN, TAG, '%{public}s', message);
}

export default function protocolParserCoreTest(): void {
  describe('SocketProtocolCoreTest', () => {
    beforeEach(yieldToEventLoop);

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0401
     * @tc.name      testProtocol0401
     * @tc.desc      Verify the text online classifies as the ONLINE command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0401', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0401 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual classifyCommand('online')=${classifyCommand('online')}`);
      expect(classifyCommand('online')).assertEqual(SocketCommandKind.ONLINE);
      log('testProtocol0401 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0402
     * @tc.name      testProtocol0402
     * @tc.desc      Verify the text offline classifies as the OFFLINE command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0402', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0402 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual classifyCommand('offline')=${classifyCommand('offline')}`);
      expect(classifyCommand('offline')).assertEqual(SocketCommandKind.OFFLINE);
      log('testProtocol0402 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0403
     * @tc.name      testProtocol0403
     * @tc.desc      Verify the text exit classifies as the EXIT command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0403', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0403 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual classifyCommand('exit')=${classifyCommand('exit')}`);
      expect(classifyCommand('exit')).assertEqual(SocketCommandKind.EXIT);
      log('testProtocol0403 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0404
     * @tc.name      testProtocol0404
     * @tc.desc      Verify ordinary text classifies as a CHAT payload.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0404', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0404 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual classifyCommand('hello')=${classifyCommand('hello')}`);
      expect(classifyCommand('hello')).assertEqual(SocketCommandKind.CHAT);
      log('testProtocol0404 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0405
     * @tc.name      testProtocol0405
     * @tc.desc      Verify an empty text classifies as UNKNOWN.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0405', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0405 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual classifyCommand('')=${classifyCommand('')}`);
      expect(classifyCommand('')).assertEqual(SocketCommandKind.UNKNOWN);
      log('testProtocol0405 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0406
     * @tc.name      testProtocol0406
     * @tc.desc      Verify classification is case sensitive for Online.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0406', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0406 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual classifyCommand('Online')=${classifyCommand('Online')}`);
      expect(classifyCommand('Online')).assertEqual(SocketCommandKind.CHAT);
      log('testProtocol0406 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0407
     * @tc.name      testProtocol0407
     * @tc.desc      Verify classification is case sensitive for ONLINE.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0407', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0407 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual classifyCommand('ONLINE')=${classifyCommand('ONLINE')}`);
      expect(classifyCommand('ONLINE')).assertEqual(SocketCommandKind.CHAT);
      log('testProtocol0407 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0408
     * @tc.name      testProtocol0408
     * @tc.desc      Verify classification is case sensitive for EXIT.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0408', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0408 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual classifyCommand('EXIT')=${classifyCommand('EXIT')}`);
      expect(classifyCommand('EXIT')).assertEqual(SocketCommandKind.CHAT);
      log('testProtocol0408 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0409
     * @tc.name      testProtocol0409
     * @tc.desc      Verify a leading space prevents the online command match.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0409', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0409 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual classifyCommand(' online')=${classifyCommand(' online')}`);
      expect(classifyCommand(' online')).assertEqual(SocketCommandKind.CHAT);
      log('testProtocol0409 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0410
     * @tc.name      testProtocol0410
     * @tc.desc      Verify a trailing space prevents the online command match.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0410', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0410 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual classifyCommand('online ')=${classifyCommand('online ')}`);
      expect(classifyCommand('online ')).assertEqual(SocketCommandKind.CHAT);
      log('testProtocol0410 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0411
     * @tc.name      testProtocol0411
     * @tc.desc      Verify a truncated control word falls back to chat.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0411', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0411 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual classifyCommand('onlin')=${classifyCommand('onlin')}`);
      expect(classifyCommand('onlin')).assertEqual(SocketCommandKind.CHAT);
      log('testProtocol0411 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0412
     * @tc.name      testProtocol0412
     * @tc.desc      Verify an extended control word falls back to chat.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0412', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0412 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual classifyCommand('onlinee')=${classifyCommand('onlinee')}`);
      expect(classifyCommand('onlinee')).assertEqual(SocketCommandKind.CHAT);
      log('testProtocol0412 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0413
     * @tc.name      testProtocol0413
     * @tc.desc      Verify a Chinese message classifies as chat.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0413', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0413 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual classifyCommand('你好')=${classifyCommand('你好')}`);
      expect(classifyCommand('你好')).assertEqual(SocketCommandKind.CHAT);
      log('testProtocol0413 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0414
     * @tc.name      testProtocol0414
     * @tc.desc      Verify a suffixed offline word falls back to chat.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0414', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0414 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual classifyCommand('offline2')=${classifyCommand('offline2')}`);
      expect(classifyCommand('offline2')).assertEqual(SocketCommandKind.CHAT);
      log('testProtocol0414 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0415
     * @tc.name      testProtocol0415
     * @tc.desc      Verify a numeric message classifies as chat.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0415', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0415 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual classifyCommand('12345')=${classifyCommand('12345')}`);
      expect(classifyCommand('12345')).assertEqual(SocketCommandKind.CHAT);
      log('testProtocol0415 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0416
     * @tc.name      testProtocol0416
     * @tc.desc      Verify the classifier result keeps the number type.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0416', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0416 begin');
      const kind: SocketCommandKind = classifyCommand('any');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof kind=${typeof kind}, expected='number'`);
      expect(typeof kind).assertEqual('number');
      log('testProtocol0416 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0417
     * @tc.name      testProtocol0417
     * @tc.desc      Verify the first two command enum values keep their codes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0417', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0417 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual SocketCommandKind.ONLINE=${SocketCommandKind.ONLINE}`);
      expect(SocketCommandKind.ONLINE).assertEqual(0);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual SocketCommandKind.OFFLINE=${SocketCommandKind.OFFLINE}`);
      expect(SocketCommandKind.OFFLINE).assertEqual(1);
      log('testProtocol0417 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0418
     * @tc.name      testProtocol0418
     * @tc.desc      Verify the remaining command enum values keep their codes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0418', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0418 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual SocketCommandKind.EXIT=${SocketCommandKind.EXIT}, expected=2`);
      expect(SocketCommandKind.EXIT).assertEqual(2);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual SocketCommandKind.CHAT=${SocketCommandKind.CHAT}, expected=3`);
      expect(SocketCommandKind.CHAT).assertEqual(3);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual SocketCommandKind.UNKNOWN=${SocketCommandKind.UNKNOWN}`);
      expect(SocketCommandKind.UNKNOWN).assertEqual(4);
      log('testProtocol0418 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0419
     * @tc.name      testProtocol0419
     * @tc.desc      Verify the handshake word ok is treated as chat payload.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0419', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0419 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual classifyCommand('ok')=${classifyCommand('ok')}`);
      expect(classifyCommand('ok')).assertEqual(SocketCommandKind.CHAT);
      log('testProtocol0419 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0420
     * @tc.name      testProtocol0420
     * @tc.desc      Verify a lone space is chat payload rather than unknown.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0420', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0420 begin');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual classifyCommand(' ')=${classifyCommand(' ')}`);
      expect(classifyCommand(' ')).assertEqual(SocketCommandKind.CHAT);
      log('testProtocol0420 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0421
     * @tc.name      testProtocol0421
     * @tc.desc      Verify an online frame parses with kind and raw length six.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0421', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0421 begin');
      const frame = parseCommandFrame(encodeCommandFrame('online'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame.kind=${frame.kind}, expected=SocketCommandKind.ONLINE`);
      expect(frame.kind).assertEqual(SocketCommandKind.ONLINE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame.payload=${frame.payload}, expected='online'`);
      expect(frame.payload).assertEqual('online');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame.rawLength=${frame.rawLength}, expected=6`);
      expect(frame.rawLength).assertEqual(6);
      log('testProtocol0421 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0422
     * @tc.name      testProtocol0422
     * @tc.desc      Verify an offline frame parses with raw length seven.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0422', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0422 begin');
      const frame = parseCommandFrame(encodeCommandFrame('offline'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame.kind=${frame.kind}, expected=SocketCommandKind.OFFLINE`);
      expect(frame.kind).assertEqual(SocketCommandKind.OFFLINE);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame.rawLength=${frame.rawLength}, expected=7`);
      expect(frame.rawLength).assertEqual(7);
      log('testProtocol0422 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0423
     * @tc.name      testProtocol0423
     * @tc.desc      Verify an exit frame parses with raw length four.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0423', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0423 begin');
      const frame = parseCommandFrame(encodeCommandFrame('exit'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame.kind=${frame.kind}, expected=SocketCommandKind.EXIT`);
      expect(frame.kind).assertEqual(SocketCommandKind.EXIT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame.rawLength=${frame.rawLength}, expected=4`);
      expect(frame.rawLength).assertEqual(4);
      log('testProtocol0423 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0424
     * @tc.name      testProtocol0424
     * @tc.desc      Verify a chat frame preserves the exact payload text.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0424', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0424 begin');
      const frame = parseCommandFrame(encodeCommandFrame('hi'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame.kind=${frame.kind}, expected=SocketCommandKind.CHAT`);
      expect(frame.kind).assertEqual(SocketCommandKind.CHAT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame.payload=${frame.payload}, expected='hi'`);
      expect(frame.payload).assertEqual('hi');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame.rawLength=${frame.rawLength}, expected=2`);
      expect(frame.rawLength).assertEqual(2);
      log('testProtocol0424 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0426
     * @tc.name      testProtocol0426
     * @tc.desc      Verify a three byte Chinese character round-trips to chat.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0426', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0426 begin');
      const frame = parseCommandFrame(encodeCommandFrame('好'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame.kind=${frame.kind}, expected=SocketCommandKind.CHAT`);
      expect(frame.kind).assertEqual(SocketCommandKind.CHAT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame.payload=${frame.payload}, expected='好'`);
      expect(frame.payload).assertEqual('好');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame.rawLength=${frame.rawLength}, expected=3`);
      expect(frame.rawLength).assertEqual(3);
      log('testProtocol0426 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0427
     * @tc.name      testProtocol0427
     * @tc.desc      Verify two Chinese characters round-trip with six bytes.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0427', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0427 begin');
      const frame = parseCommandFrame(encodeCommandFrame('你好'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame.payload=${frame.payload}, expected='你好'`);
      expect(frame.payload).assertEqual('你好');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame.rawLength=${frame.rawLength}, expected=6`);
      expect(frame.rawLength).assertEqual(6);
      log('testProtocol0427 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0428
     * @tc.name      testProtocol0428
     * @tc.desc      Verify mixed ascii and CJK text round-trips byte counts.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0428', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0428 begin');
      const frame = parseCommandFrame(encodeCommandFrame('a好b'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame.payload=${frame.payload}, expected='a好b'`);
      expect(frame.payload).assertEqual('a好b');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame.rawLength=${frame.rawLength}, expected=5`);
      expect(frame.rawLength).assertEqual(5);
      log('testProtocol0428 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0429
     * @tc.name      testProtocol0429
     * @tc.desc      Verify inner spaces survive the frame round-trip.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0429', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0429 begin');
      const frame = parseCommandFrame(encodeCommandFrame('hi there'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame.payload=${frame.payload}, expected='hi there'`);
      expect(frame.payload).assertEqual('hi there');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame.rawLength=${frame.rawLength}, expected=8`);
      expect(frame.rawLength).assertEqual(8);
      log('testProtocol0429 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0430
     * @tc.name      testProtocol0430
     * @tc.desc      Verify hand built ascii bytes decode to the chat payload.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0430', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0430 begin');
      const bytes: Uint8Array = new Uint8Array([104, 105]);
      const frame = parseCommandFrame(bytes);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame.kind=${frame.kind}, expected=SocketCommandKind.CHAT`);
      expect(frame.kind).assertEqual(SocketCommandKind.CHAT);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame.payload=${frame.payload}, expected='hi'`);
      expect(frame.payload).assertEqual('hi');
      log('testProtocol0430 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0431
     * @tc.name      testProtocol0431
     * @tc.desc      Verify hand built online bytes decode to the online command.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0431', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0431 begin');
      const bytes: Uint8Array = new Uint8Array([111, 110, 108, 105, 110, 101]);
      const frame = parseCommandFrame(bytes);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame.kind=${frame.kind}, expected=SocketCommandKind.ONLINE`);
      expect(frame.kind).assertEqual(SocketCommandKind.ONLINE);
      log('testProtocol0431 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0432
     * @tc.name      testProtocol0432
     * @tc.desc      Verify an emoji encodes to four utf-8 bytes and round-trips.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0432', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0432 begin');
      const frame = parseCommandFrame(encodeCommandFrame('😊'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame.payload=${frame.payload}, expected='😊'`);
      expect(frame.payload).assertEqual('😊');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame.rawLength=${frame.rawLength}, expected=4`);
      expect(frame.rawLength).assertEqual(4);
      log('testProtocol0432 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0433
     * @tc.name      testProtocol0433
     * @tc.desc      Verify a 256 character message keeps its full payload.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0433', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0433 begin');
      const longText: string = 'x'.repeat(256);
      const frame = parseCommandFrame(encodeCommandFrame(longText));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame.payload=${frame.payload}, expected=longText`);
      expect(frame.payload).assertEqual(longText);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual frame.rawLength=${frame.rawLength}, expected=256`);
      expect(frame.rawLength).assertEqual(256);
      log('testProtocol0433 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0434
     * @tc.name      testProtocol0434
     * @tc.desc      Verify the parsed frame exposes the expected field types.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0434', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0434 begin');
      const frame = parseCommandFrame(encodeCommandFrame('data'));
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof frame.kind=${typeof frame.kind}, expected='number'`);
      expect(typeof frame.kind).assertEqual('number');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof frame.payload=${typeof frame.payload}`);
      expect(typeof frame.payload).assertEqual('string');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual typeof frame.rawLength=${typeof frame.rawLength}`);
      expect(typeof frame.rawLength).assertEqual('number');
      log('testProtocol0434 end');
    })

    /**
     * @tc.number    SUB_SOCKET_PROTOCOL_0435
     * @tc.name      testProtocol0435
     * @tc.desc      Verify the exit frame bytes match the ascii encoding.
     * @tc.type      FUNCTION
     * @tc.size      SMALLTEST
     * @tc.level     LEVEL0
     */
    it('testProtocol0435', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      log('testProtocol0435 begin');
      const bytes: Uint8Array = encodeCommandFrame('exit');
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes.length=${bytes.length}, expected=4`);
      expect(bytes.length).assertEqual(4);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes[0]=${bytes[0]}, expected=101`);
      expect(bytes[0]).assertEqual(101);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes[1]=${bytes[1]}, expected=120`);
      expect(bytes[1]).assertEqual(120);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes[2]=${bytes[2]}, expected=105`);
      expect(bytes[2]).assertEqual(105);
      hilog.info(DOMAIN, TAG, '%{public}s', `assertEqual bytes[3]=${bytes[3]}, expected=116`);
      expect(bytes[3]).assertEqual(116);
      log('testProtocol0435 end');
    })
  })
}
