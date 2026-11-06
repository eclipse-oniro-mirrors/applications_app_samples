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
 
import { describe, it, expect } from '@ohos/hypium';
import fastbuffer from '@ohos.fastbuffer';
import { TlvUtil, TlvParseResult, TlvRecord } from '../../../main/ets/model/utils/TlvUtil';
import { FastBufferUtil } from '../../../main/ets/model/utils/FastBufferUtil';

/**
 * TLV 协议流矩阵测试
 *
 * 记录格式 = [魔数 4B][tag 1B][length 4B 大端][value][CRC32 4B]，单条 9 + valueSize + 4 字节。
 * 覆盖：记录数 × value 长度 × 有无噪声的封包-解析矩阵、长度字段大端编码、
 * 截断位置矩阵（头截断/体截断/整条丢弃）、坏 CRC 位于首/中/末记录、值篡改、
 * 尾部噪声计数、空缓冲与魔数残片。
 */

const HEADER_SIZE = 9;
const CRC_SIZE = 4;

function buildNoiseOnly(bytes: number[]): fastbuffer.FastBuffer {
  const buf = fastbuffer.alloc(bytes.length);
  for (let i = 0; i < bytes.length; i++) {
    buf.writeUInt8(bytes[i], i);
  }
  return buf;
}

export default function tlvMatrixTest() {
  describe('tlvMatrixTest', () => {
    /**
     * @tc.number SUB_FASTBUFFER_STREAM_TLVMATRIX_0100
     * @tc.name roundtrip_single_min_value
     * @tc.desc Verify one record with a three-byte value parses cleanly into a sixteen-byte stream
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('roundtrip_single_min_value', 0, () => {
      const stream = TlvUtil.buildTlvStream(1, 3, false);
      expect(stream.length).assertEqual(16);
      const result: TlvParseResult = TlvUtil.parseTlvStream(stream);
      expect(result.ok).assertTrue();
      expect(result.records.length).assertEqual(1);
      expect(result.noiseBytes).assertEqual(0);
      expect(result.errorIndex).assertEqual(-1);
      expect(result.records[0].tag).assertEqual(1);
      expect(result.records[0].length).assertEqual(3);
      expect(result.records[0].crcOk).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_TLVMATRIX_0200
     * @tc.name roundtrip_three_records
     * @tc.desc Verify three sixteen-byte-value records total eighty-seven bytes and all parse with valid CRCs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('roundtrip_three_records', 0, () => {
      const stream = TlvUtil.buildTlvStream(3, 16, false);
      expect(stream.length).assertEqual(87);
      const result: TlvParseResult = TlvUtil.parseTlvStream(stream);
      expect(result.ok).assertTrue();
      expect(result.records.length).assertEqual(3);
      expect(result.noiseBytes).assertEqual(0);
      expect(result.errorIndex).assertEqual(-1);
      for (let i = 0; i < result.records.length; i++) {
        expect(result.records[i].tag).assertEqual(i + 1);
        expect(result.records[i].length).assertEqual(16);
        expect(result.records[i].crcOk).assertTrue();
      }
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_TLVMATRIX_0300
     * @tc.name roundtrip_five_records_with_noise
     * @tc.desc Verify five records inside nineteen noise bytes still parse every CRC correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('roundtrip_five_records_with_noise', 0, () => {
      const stream = TlvUtil.buildTlvStream(5, 48, true);
      expect(stream.length).assertEqual(324);
      const result: TlvParseResult = TlvUtil.parseTlvStream(stream);
      expect(result.ok).assertTrue();
      expect(result.records.length).assertEqual(5);
      expect(result.noiseBytes).assertEqual(19);
      expect(result.errorIndex).assertEqual(-1);
      for (let i = 0; i < result.records.length; i++) {
        expect(result.records[i].tag).assertEqual(i + 1);
        expect(result.records[i].length).assertEqual(48);
        expect(result.records[i].crcOk).assertTrue();
      }
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_TLVMATRIX_0400
     * @tc.name roundtrip_eight_records
     * @tc.desc Verify eight sixty-four-byte-value records total six hundred sixteen bytes and all parse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('roundtrip_eight_records', 0, () => {
      const stream = TlvUtil.buildTlvStream(8, 64, false);
      expect(stream.length).assertEqual(616);
      const result: TlvParseResult = TlvUtil.parseTlvStream(stream);
      expect(result.ok).assertTrue();
      expect(result.records.length).assertEqual(8);
      expect(result.noiseBytes).assertEqual(0);
      expect(result.errorIndex).assertEqual(-1);
      for (let i = 0; i < result.records.length; i++) {
        expect(result.records[i].tag).assertEqual(i + 1);
        expect(result.records[i].length).assertEqual(64);
        expect(result.records[i].crcOk).assertTrue();
      }
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_TLVMATRIX_0500
     * @tc.name truncate_one_byte
     * @tc.desc Verify cutting one byte from a two-record stream reports truncation at the second record
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('truncate_one_byte', 0, () => {
      const full = TlvUtil.buildTlvStream(2, 16, false);
      const cut = full.subarray(0, full.length - 1);
      const result: TlvParseResult = TlvUtil.parseTlvStream(cut);
      expect(result.ok).assertFalse();
      expect(result.records.length).assertEqual(1);
      expect(result.errorIndex).assertEqual(HEADER_SIZE + 16 + CRC_SIZE);
      expect(result.errorMessage.includes('truncated')).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_TLVMATRIX_0600
     * @tc.name truncate_four_bytes_crc
     * @tc.desc Verify cutting the full CRC field of the last record reports truncation at its start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('truncate_four_bytes_crc', 0, () => {
      const full = TlvUtil.buildTlvStream(2, 16, false);
      const cut = full.subarray(0, full.length - 4);
      const result: TlvParseResult = TlvUtil.parseTlvStream(cut);
      expect(result.ok).assertFalse();
      expect(result.records.length).assertEqual(1);
      expect(result.errorIndex).assertEqual(HEADER_SIZE + 16 + CRC_SIZE);
      expect(result.errorMessage.includes('truncated')).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_TLVMATRIX_0700
     * @tc.name truncate_nine_bytes_header
     * @tc.desc Verify cutting header plus CRC of the last record leaves only its one-byte body
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('truncate_nine_bytes_header', 0, () => {
      const full = TlvUtil.buildTlvStream(2, 16, false);
      const cut = full.subarray(0, full.length - 9);
      const result: TlvParseResult = TlvUtil.parseTlvStream(cut);
      expect(result.ok).assertFalse();
      expect(result.records.length).assertEqual(1);
      expect(result.errorIndex).assertEqual(HEADER_SIZE + 16 + CRC_SIZE);
      expect(result.errorMessage.includes('truncated')).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_TLVMATRIX_0800
     * @tc.name truncate_twenty_one_bytes_header_only
     * @tc.desc Verify leaving only a nine-byte header of the last record reports a header truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('truncate_twenty_one_bytes_header_only', 0, () => {
      const full = TlvUtil.buildTlvStream(2, 16, false);
      const cut = full.subarray(0, full.length - 21);
      const result: TlvParseResult = TlvUtil.parseTlvStream(cut);
      expect(result.ok).assertFalse();
      expect(result.records.length).assertEqual(1);
      expect(result.errorIndex).assertEqual(HEADER_SIZE + 16 + CRC_SIZE);
      expect(result.errorMessage.includes('header truncated')).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_TLVMATRIX_0900
     * @tc.name truncate_drop_whole_last_record_is_clean
     * @tc.desc Verify removing the last whole record leaves a clean two-record stream without error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('truncate_drop_whole_last_record_is_clean', 0, () => {
      const full = TlvUtil.buildTlvStream(3, 16, false);
      const recordSize = HEADER_SIZE + 16 + CRC_SIZE;
      const cut = full.subarray(0, full.length - recordSize);
      const result: TlvParseResult = TlvUtil.parseTlvStream(cut);
      expect(result.ok).assertTrue();
      expect(result.records.length).assertEqual(2);
      expect(result.noiseBytes).assertEqual(0);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_TLVMATRIX_1000
     * @tc.name truncate_error_index_points_to_record_start
     * @tc.desc Verify a six-byte tail cut reports the error index at the third record start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('truncate_error_index_points_to_record_start', 0, () => {
      const full = TlvUtil.buildTlvStream(3, 16, false);
      const cut = full.subarray(0, full.length - 6);
      const result: TlvParseResult = TlvUtil.parseTlvStream(cut);
      expect(result.errorIndex).assertEqual(2 * (HEADER_SIZE + 16 + CRC_SIZE));
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_TLVMATRIX_1100
     * @tc.name bad_crc_second_record_of_five
     * @tc.desc Verify only the second record of five is flagged when its CRC is corrupted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bad_crc_second_record_of_five', 0, () => {
      const stream = TlvUtil.makeBadCrcStream(5, 32);
      const result: TlvParseResult = TlvUtil.parseTlvStream(stream);
      expect(result.ok).assertTrue();
      expect(result.records.length).assertEqual(5);
      expect(result.records[1].crcOk).assertFalse();
      expect(result.records[0].crcOk).assertTrue();
      expect(result.records[4].crcOk).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_TLVMATRIX_1200
     * @tc.name bad_crc_keeps_stream_length
     * @tc.desc Verify corrupting a CRC field does not change the total stream length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bad_crc_keeps_stream_length', 0, () => {
      const clean = TlvUtil.buildTlvStream(3, 48, false);
      const bad = TlvUtil.makeBadCrcStream(3, 48);
      expect(bad.length).assertEqual(clean.length);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_TLVMATRIX_1300
     * @tc.name bad_crc_last_record
     * @tc.desc Verify flipping the last byte of the stream flags only the final record CRC
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('bad_crc_last_record', 0, () => {
      const stream = TlvUtil.buildTlvStream(3, 48, false);
      const last = stream.length - 1;
      stream.writeUInt8(stream.readUInt8(last) ^ 0xFF, last);
      const result: TlvParseResult = TlvUtil.parseTlvStream(stream);
      expect(result.records.length).assertEqual(3);
      expect(result.records[2].crcOk).assertFalse();
      expect(result.records[0].crcOk).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_TLVMATRIX_1400
     * @tc.name tampered_value_detected
     * @tc.desc Verify flipping one value byte of the first record flags it while the second stays valid
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('tampered_value_detected', 0, () => {
      const stream = TlvUtil.buildTlvStream(2, 16, false);
      const valueStart = HEADER_SIZE;
      stream.writeUInt8(stream.readUInt8(valueStart) ^ 0xFF, valueStart);
      const result: TlvParseResult = TlvUtil.parseTlvStream(stream);
      expect(result.ok).assertTrue();
      expect(result.records[0].crcOk).assertFalse();
      expect(result.records[1].crcOk).assertTrue();
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_TLVMATRIX_1500
     * @tc.name length_field_encodes_three_bytes
     * @tc.desc Verify a three-byte value length is encoded big-endian as 00 00 00 03
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('length_field_encodes_three_bytes', 0, () => {
      const stream = TlvUtil.buildTlvStream(1, 3, false);
      expect(FastBufferUtil.readUint32(stream, 5, false)).assertEqual(3);
      expect(stream.readUInt8(5)).assertEqual(0);
      expect(stream.readUInt8(6)).assertEqual(0);
      expect(stream.readUInt8(7)).assertEqual(0);
      expect(stream.readUInt8(8)).assertEqual(3);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_TLVMATRIX_1600
     * @tc.name length_field_encodes_two_hundred_fifty_six
     * @tc.desc Verify a two-hundred-fifty-six-byte value length is encoded as 00 00 01 00
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('length_field_encodes_two_hundred_fifty_six', 0, () => {
      const stream = TlvUtil.buildTlvStream(1, 256, false);
      expect(stream.length).assertEqual(HEADER_SIZE + 256 + CRC_SIZE);
      expect(FastBufferUtil.readUint32(stream, 5, false)).assertEqual(256);
      expect(stream.readUInt8(5)).assertEqual(0);
      expect(stream.readUInt8(6)).assertEqual(0);
      expect(stream.readUInt8(7)).assertEqual(1);
      expect(stream.readUInt8(8)).assertEqual(0);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_TLVMATRIX_1700
     * @tc.name value_prefix_matches_record_index
     * @tc.desc Verify each parsed value starts with its record index marker R1 R2 or R3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('value_prefix_matches_record_index', 0, () => {
      const result: TlvParseResult = TlvUtil.parseTlvStream(TlvUtil.buildTlvStream(3, 8, false));
      const prefixes: string[] = ['R1-', 'R2-', 'R3-'];
      for (let i = 0; i < result.records.length; i++) {
        const text: string = FastBufferUtil.utf8ViewDecode(result.records[i].value);
        expect(text.startsWith(prefixes[i])).assertTrue();
      }
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_TLVMATRIX_1800
     * @tc.name noise_between_records_counted
     * @tc.desc Verify noise inserted between four records is counted as three plus three per gap
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('noise_between_records_counted', 0, () => {
      const result: TlvParseResult = TlvUtil.parseTlvStream(TlvUtil.buildTlvStream(4, 32, true));
      expect(result.records.length).assertEqual(4);
      expect(result.noiseBytes).assertEqual(3 + 4 * 3);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_TLVMATRIX_1900
     * @tc.name trailing_noise_counted
     * @tc.desc Verify five trailing noise bytes after a valid record are counted without errors
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('trailing_noise_counted', 0, () => {
      const base = TlvUtil.buildTlvStream(1, 32, false);
      const tail = buildNoiseOnly([0xA5, 0x5A, 0xA5, 0x5A, 0xA5]);
      const result: TlvParseResult = TlvUtil.parseTlvStream(FastBufferUtil.concatAll([base, tail]));
      expect(result.ok).assertTrue();
      expect(result.records.length).assertEqual(1);
      expect(result.noiseBytes).assertEqual(5);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_TLVMATRIX_2000
     * @tc.name partial_magic_prefix_is_noise
     * @tc.desc Verify an incomplete magic prefix is treated as three noise bytes with no records
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('partial_magic_prefix_is_noise', 0, () => {
      const result: TlvParseResult = TlvUtil.parseTlvStream(buildNoiseOnly([0x4F, 0x48, 0x4F]));
      expect(result.ok).assertTrue();
      expect(result.records.length).assertEqual(0);
      expect(result.noiseBytes).assertEqual(3);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_TLVMATRIX_2100
     * @tc.name empty_buffer_parses_clean
     * @tc.desc Verify an empty stream parses as ok with no records no noise and no error index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('empty_buffer_parses_clean', 0, () => {
      const result: TlvParseResult = TlvUtil.parseTlvStream(fastbuffer.alloc(0));
      expect(result.ok).assertTrue();
      expect(result.records.length).assertEqual(0);
      expect(result.noiseBytes).assertEqual(0);
      expect(result.errorIndex).assertEqual(-1);
    });

    /**
     * @tc.number SUB_FASTBUFFER_STREAM_TLVMATRIX_2200
     * @tc.name record_object_defaults_are_zeroed
     * @tc.desc Verify a freshly constructed TlvRecord has zeroed numeric fields and an empty value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 1
     */
    it('record_object_defaults_are_zeroed', 0, () => {
      const record: TlvRecord = new TlvRecord();
      expect(record.tag).assertEqual(0);
      expect(record.length).assertEqual(0);
      expect(record.value.length).assertEqual(0);
      expect(record.crcOk).assertFalse();
    });
  });
}
