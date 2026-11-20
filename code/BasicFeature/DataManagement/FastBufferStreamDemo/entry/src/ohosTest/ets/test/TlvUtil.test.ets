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
 
import { describe, beforeAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import fastbuffer from '@ohos.fastbuffer';
import { TlvUtil, TlvParseResult } from '../../../main/ets/model/utils/TlvUtil';
import { FastBufferUtil } from '../../../main/ets/model/utils/FastBufferUtil';

/**
 * TlvUtil TLV 协议流解析设备侧测试
 * 记录格式 = [魔数 4B][tag 1B][length 4B 大端][value][CRC32 4B]
 * 覆盖：封包-解析往返、噪声中定位魔数、大端长度字段、坏 CRC 检出、
 * 截断记录报错、无魔数空流
 */
export default function tlvUtilTest() {
  describe('tlvUtilTest', () => {
    beforeAll(() => {
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_TLVUTIL_0100
     * @tc.name buildParseRoundtrip001
     * @tc.desc Verify a five-record TLV stream parses back with matching count, tags, lengths and CRC checks
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('buildParseRoundtrip', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const stream = TlvUtil.buildTlvStream(5, 48, false);
      // 单条记录 = 9B 头 + 48B value + 4B CRC = 61B，5 条共 305B
      expect(stream.length).assertEqual(305);
      const result: TlvParseResult = TlvUtil.parseTlvStream(stream);
      expect(result.ok).assertTrue();
      expect(result.records.length).assertEqual(5);
      for (const rec of result.records) {
        expect(rec.crcOk).assertTrue();
        expect(rec.length).assertEqual(48);
      }
      // tag 依次为 1..5，value 前缀 R{n}-
      expect(result.records[0].tag).assertEqual(1);
      expect(result.records[4].tag).assertEqual(5);
      // 本 ROM 对视图嵌套 subarray 不累加父偏移（落回缓冲开头），故直接解码整段 value
      const valueText: string = FastBufferUtil.utf8ViewDecode(result.records[2].value);
      expect(valueText.startsWith('R3-')).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_TLVUTIL_0200
     * @tc.name magicSearchWithNoise002
     * @tc.desc Verify records are located across noise bytes and the noise byte count is reported correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('magicSearchWithNoise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const stream = TlvUtil.buildTlvStream(5, 32, true);
      const result: TlvParseResult = TlvUtil.parseTlvStream(stream);
      // 噪声不干扰定位：5 条记录全部解析出，噪声字节数 = 首部 3B + 记录间 4B×4 = 19B
      expect(result.ok).assertTrue();
      expect(result.records.length).assertEqual(5);
      expect(result.noiseBytes).assertEqual(19);
      expect(result.records[2].crcOk).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_TLVUTIL_0300
     * @tc.name bigEndianLengthField003
     * @tc.desc Verify the length field is encoded as a four-byte big-endian value after the magic and tag
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bigEndianLengthField', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const stream = TlvUtil.buildTlvStream(2, 48, false);
      // 长度字段在魔数（4B）+ tag（1B）之后：偏移 5 起 4B 大端
      expect(FastBufferUtil.readUint32(stream, 5, false)).assertEqual(48);
      // 大端字节序校验：高字节在前（0x00 0x00 0x00 0x30）
      expect(stream.readUInt8(5)).assertEqual(0);
      expect(stream.readUInt8(8)).assertEqual(48);
      // 小端读同一字段应得到错位值，反向佐证大端编码
      expect(FastBufferUtil.readUint32(stream, 5, true) === 48).assertFalse();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_TLVUTIL_0400
     * @tc.name badCrcDetected004
     * @tc.desc Verify a tampered record CRC is detected while the other records remain valid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('badCrcDetected', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const stream = TlvUtil.makeBadCrcStream(3, 48);
      const result: TlvParseResult = TlvUtil.parseTlvStream(stream);
      // 篡改 CRC 不影响结构完整性，但第 2 条记录（tag=2）应标记 crcOk=false
      expect(result.ok).assertTrue();
      expect(result.records.length).assertEqual(3);
      expect(result.records[1].tag).assertEqual(2);
      expect(result.records[1].crcOk).assertFalse();
      expect(result.records[0].crcOk).assertTrue();
      expect(result.records[2].crcOk).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_TLVUTIL_0500
     * @tc.name truncatedRecord005
     * @tc.desc Verify a truncated tail record is reported as a structural error with an error index and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('truncatedRecord', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      const full = TlvUtil.buildTlvStream(3, 48, false);
      const stream = full.subarray(0, full.length - 6);
      const result: TlvParseResult = TlvUtil.parseTlvStream(stream);
      // 前两条记录完整，末条被砍掉 CRC 4B + value 尾 2B → 结构性截断
      expect(result.ok).assertFalse();
      expect(result.records.length).assertEqual(2);
      expect(result.errorIndex >= 0).assertTrue();
      expect(result.errorMessage.length > 0).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_TLVUTIL_0600
     * @tc.name emptyStream006
     * @tc.desc Verify a noise-only stream parses as complete with zero records and all bytes counted as noise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('emptyStream', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, () => {
      // 无魔数的纯噪声流：结构完整、0 条记录，全部字节计入噪声
      const noise: fastbuffer.FastBuffer = fastbuffer.from('\x01\x02\x03\x04');
      const result: TlvParseResult = TlvUtil.parseTlvStream(noise);
      expect(result.ok).assertTrue();
      expect(result.records.length).assertEqual(0);
      expect(result.noiseBytes).assertEqual(4);
      expect(result.errorIndex).assertEqual(-1);
    });
  });
}
