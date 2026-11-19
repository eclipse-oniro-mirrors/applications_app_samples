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

import { describe, beforeEach, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { bundleManager } from '@kit.AbilityKit';
import { resourceManager } from '@kit.LocalizationKit';
import { util } from '@kit.ArkTS';
import { fileIo } from '@kit.CoreFileKit';
import { BusinessError } from '@kit.BasicServicesKit';
import {
  BACKUP_ABILITY,
  BACKUP_METADATA,
  ENTRY_ABILITY,
  ENTRY_MODULE,
  entryContext,
  ERR_RES_ID_INVALID,
  ERR_RES_NAME_INVALID,
  errorCode,
  findModule,
  PngOracle,
  selfBundle
} from './shared/AppProbe';
import { paceTurn } from './shared/TestPace';
import { logCase } from './shared/TestLog';

// entry/src/main/resources/base/media holds three png files and one layered image description. The build
// scales the two layers of the layered icon to 512 px and rewrites the '$media:name' references of the
// layered image description into '$media:<id>', so the cases below expect 512 px for the layers, 144 px
// for the start window icon (packed untouched, 20093 bytes) and accept both reference spellings.
const START_ICON_NAME: string = 'startIcon';
const BACKGROUND_NAME: string = 'background';
const FOREGROUND_NAME: string = 'foreground';
const LAYERED_NAME: string = 'layered_image';
const LAYER_KEY: string = 'layered-image';
const MEDIA_PREFIX: string = '$media:';
const IHDR_TYPE: string = 'IHDR';
const IDAT_TYPE: string = 'IDAT';
const IEND_TYPE: string = 'IEND';
const CHUNK_OVERHEAD: number = 12;
const IHDR_DATA_BYTES: number = 13;
const BIT_DEPTH_8: number = 8;
const COLOR_TYPE_RGBA: number = 6;
const SIDE_START_ICON: number = 144;
const SIDE_LAYER: number = 512;
const START_ICON_BYTES: number = 20093;
const START_ICON_CHUNK_COUNT: number = 6;
const START_ICON_IDAT_COUNT: number = 2;
const START_ICON_IDAT_BYTES: number = 19940;
const START_ICON_CHUNK_ORDER: string = 'IHDR,gAMA,eXIf,IDAT,IDAT,IEND';
const IEND_CRC: number = 0xAE426082;
const LAYER_MIN_BYTES: number = 32;
const LAYER_MAX_BYTES: number = 512;
const BACKGROUND_MIN_BYTES: number = 4096;
const FOREGROUND_MIN_BYTES: number = 1024;
const PNG_OVERHEAD_SLACK: number = 2048;
const NO_ERROR: number = 0;
const ERR_ABILITY_NOT_EXIST: number = 17700003;
const ERR_NO_PROFILE: number = 17700024;
const BACKUP_KEY: string = 'allowToBackupRestore';
const BACKUP_TRUE: string = 'true';
const BACKUP_RESOURCE_REF: string = '$profile:backup_config';
const BRACE_OPEN: string = '{';
const BRACE_CLOSE: string = '}';
const QUOTE: string = '"';
const SPACE: string = ' ';
const EMPTY_TEXT: string = '';
const LONG_NAME: string = 'x'.repeat(512);
const CJK_NAME: string = String.fromCharCode(0x5E94, 0x7528);
const BAD_ID_ZERO: number = 0;
const BAD_ID_ONE: number = 1;
const BAD_ID_MEDIA_MAX: number = 16777215;
const BAD_ID_INT_MAX: number = 0x7fffffff;
const BAD_ID_LARGE: number = 123456789;
const BAD_ID_ARBITRARY: number = 999999;
const GARBAGE_COUNT: number = 2000;
const HEAVY_GARBAGE_COUNT: number = 5000;
const TEMP_START_ICON: string = 'resmedia_start_icon.png';
const TEMP_BACKGROUND: string = 'resmedia_background.png';
const TEMP_FOREGROUND: string = 'resmedia_foreground.png';
const TEMP_LAYERED: string = 'resmedia_layered.txt';
const TEMP_SEQUENCE: string = 'resmedia_sequence.bin';
const TEMP_PAIR_FIRST: string = 'resmedia_pair_first.bin';
const TEMP_PAIR_SECOND: string = 'resmedia_pair_second.bin';

// one parsed chunk of a png stream: where the length field starts, how long the payload is and its name
class PngChunk {
  offset: number;
  dataLength: number;
  type: string;

  constructor(offset: number, dataLength: number, type: string) {
    this.offset = offset;
    this.dataLength = dataLength;
    this.type = type;
  }
}

// one scanned json member; the scanner below keeps the file free of JSON.parse so nested objects can be
// classified by hand
class JsonPair {
  key: string;
  value: string;

  constructor(key: string, value: string) {
    this.key = key;
    this.value = value;
  }
}

class TempWrite {
  path: string;
  size: number;

  constructor(path: string, size: number) {
    this.path = path;
    this.size = size;
  }
}

function resources(): resourceManager.ResourceManager {
  return entryContext().resourceManager;
}

function mediaBytes(name: string): Uint8Array {
  return resources().getMediaByNameSync(name);
}

function mediaText(name: string): string {
  return util.TextDecoder.create('utf-8').decodeToString(mediaBytes(name));
}

function sameBytes(first: Uint8Array, second: Uint8Array): boolean {
  if (first.length !== second.length) {
    return false;
  }
  for (let index = 0; index < first.length; index++) {
    if (first[index] !== second[index]) {
      return false;
    }
  }
  return true;
}

function prefixBytes(bytes: Uint8Array, count: number): Uint8Array {
  const limit: number = count < bytes.length ? count : bytes.length;
  const head: Uint8Array = new Uint8Array(limit);
  for (let index = 0; index < limit; index++) {
    head[index] = bytes[index];
  }
  return head;
}

function chunkTypeAt(bytes: Uint8Array, offset: number): string {
  return String.fromCharCode(bytes[offset + 4], bytes[offset + 5], bytes[offset + 6], bytes[offset + 7]);
}

function chunkList(bytes: Uint8Array): PngChunk[] {
  const chunks: PngChunk[] = [];
  let offset: number = PngOracle.SIGNATURE.length;
  while (offset + CHUNK_OVERHEAD <= bytes.length) {
    const dataLength: number = PngOracle.readUint32(bytes, offset);
    chunks.push(new PngChunk(offset, dataLength, chunkTypeAt(bytes, offset)));
    offset = offset + CHUNK_OVERHEAD + dataLength;
  }
  return chunks;
}

function chunkTypes(bytes: Uint8Array): string[] {
  return chunkList(bytes).map((chunk: PngChunk) => chunk.type);
}

function chunkTypeCount(bytes: Uint8Array, wanted: string): number {
  return chunkTypes(bytes).filter((type: string) => type === wanted).length;
}

function chunkDataBytes(bytes: Uint8Array, wanted: string): number {
  let total: number = 0;
  for (const chunk of chunkList(bytes)) {
    if (chunk.type === wanted) {
      total = total + chunk.dataLength;
    }
  }
  return total;
}

function chunkStoredCrc(bytes: Uint8Array, chunk: PngChunk): number {
  return PngOracle.readUint32(bytes, chunk.offset + 8 + chunk.dataLength);
}

function chunkComputedCrc(bytes: Uint8Array, chunk: PngChunk): number {
  return crc32(bytes, chunk.offset + 4, chunk.dataLength + 4);
}

function firstChunk(bytes: Uint8Array): PngChunk | undefined {
  return chunkList(bytes)[0];
}

function lastChunk(bytes: Uint8Array): PngChunk | undefined {
  const chunks: PngChunk[] = chunkList(bytes);
  return chunks[chunks.length - 1];
}

// plain bitwise crc32 over a slice, used as an independent oracle for the crc field stored in each chunk
function crc32(bytes: Uint8Array, start: number, count: number): number {
  let crc: number = 0xFFFFFFFF;
  for (let index = 0; index < count; index++) {
    crc = (crc ^ bytes[start + index]) >>> 0;
    for (let bit = 0; bit < 8; bit++) {
      if ((crc & 1) === 1) {
        crc = ((crc >>> 1) ^ 0xEDB88320) >>> 0;
      } else {
        crc = (crc >>> 1) >>> 0;
      }
    }
  }
  return (crc ^ 0xFFFFFFFF) >>> 0;
}

// independent big endian decoder: multiplication instead of the helper shift chain of PngOracle
function bigEndian32(bytes: Uint8Array, offset: number): number {
  return bytes[offset] * 16777216 + bytes[offset + 1] * 65536 + bytes[offset + 2] * 256 + bytes[offset + 3];
}

function isAsciiLetter(ch: string): boolean {
  const code: number = ch.charCodeAt(0);
  return (code >= 65 && code <= 90) || (code >= 97 && code <= 122);
}

function isJsonWhitespace(ch: string): boolean {
  return ch === SPACE || ch === '\n' || ch === '\r' || ch === '\t';
}

// flat json scanner: produces every 'key' : value member as it appears, nested objects show up as a '{' value
function scanPairs(text: string): JsonPair[] {
  const pairs: JsonPair[] = [];
  let cursor: number = 0;
  while (cursor < text.length) {
    const keyOpen: number = text.indexOf(QUOTE, cursor);
    if (keyOpen < 0) {
      break;
    }
    const keyClose: number = text.indexOf(QUOTE, keyOpen + 1);
    if (keyClose < 0) {
      break;
    }
    const colon: number = text.indexOf(':', keyClose + 1);
    if (colon < 0) {
      break;
    }
    const key: string = text.substring(keyOpen + 1, keyClose);
    let valueCursor: number = colon + 1;
    while (valueCursor < text.length && isJsonWhitespace(text.charAt(valueCursor))) {
      valueCursor = valueCursor + 1;
    }
    let value: string = EMPTY_TEXT;
    if (text.charAt(valueCursor) === QUOTE) {
      const valueClose: number = text.indexOf(QUOTE, valueCursor + 1);
      if (valueClose < 0) {
        break;
      }
      value = text.substring(valueCursor + 1, valueClose);
      cursor = valueClose + 1;
    } else {
      let end: number = valueCursor;
      while (end < text.length) {
        const ch: string = text.charAt(end);
        if (ch === ',' || ch === BRACE_CLOSE || ch === ']' || ch === '\n' || ch === '\r' || ch === SPACE) {
          break;
        }
        end = end + 1;
      }
      value = text.substring(valueCursor, end);
      cursor = end;
    }
    pairs.push(new JsonPair(key, value));
  }
  return pairs;
}

function pairValue(pairs: JsonPair[], key: string): string {
  let value: string = EMPTY_TEXT;
  for (const pair of pairs) {
    if (pair.key === key) {
      value = pair.value;
    }
  }
  return value;
}

function pairCount(pairs: JsonPair[], key: string): number {
  return pairs.filter((pair: JsonPair) => pair.key === key).length;
}

function refTarget(reference: string): string {
  return reference.startsWith(MEDIA_PREFIX) ? reference.substring(MEDIA_PREFIX.length) : EMPTY_TEXT;
}

function isDigits(text: string): boolean {
  if (text.length === 0) {
    return false;
  }
  for (let index = 0; index < text.length; index++) {
    const code: number = text.charCodeAt(index);
    if (code < 48 || code > 57) {
      return false;
    }
  }
  return true;
}

function layerBytes(reference: string): Uint8Array {
  const target: string = refTarget(reference);
  if (isDigits(target)) {
    return resources().getMediaContentSync(Number(target));
  }
  return resources().getMediaByNameSync(target);
}

function layeredPairs(): JsonPair[] {
  return scanPairs(mediaText(LAYERED_NAME));
}

function layeredReference(key: string): string {
  return pairValue(layeredPairs(), key);
}

function countChar(text: string, wanted: string): number {
  let total: number = 0;
  for (let index = 0; index < text.length; index++) {
    if (text.charAt(index) === wanted) {
      total = total + 1;
    }
  }
  return total;
}

async function entryAbilityInfo(): Promise<bundleManager.AbilityInfo> {
  const info: bundleManager.BundleInfo = await selfBundle();
  return findModule(info, ENTRY_MODULE).abilitiesInfo[0];
}

// the stage model module info carries no page list any more: it publishes the name of the ability that hosts the
// pages through mainElementName, which is what the page entry cases below assert on
async function entryMainElementName(): Promise<string> {
  const info: bundleManager.BundleInfo = await selfBundle();
  return findModule(info, ENTRY_MODULE).mainElementName;
}

function backupProfileTexts(): string[] {
  return bundleManager.getProfileByExtensionAbilitySync(ENTRY_MODULE, BACKUP_ABILITY, BACKUP_METADATA);
}

function profileErrorCode(moduleName: string, extensionName: string, metadataName: string): number {
  return errorCode(() => {
    bundleManager.getProfileByExtensionAbilitySync(moduleName, extensionName, metadataName);
  });
}

async function asyncMediaErrorCode(name: string): Promise<number> {
  try {
    await resources().getMediaByName(name);
  } catch (error) {
    return Number((error as BusinessError).code);
  }
  return NO_ERROR;
}

function writeTempMedia(fileName: string, bytes: Uint8Array): TempWrite {
  const path: string = entryContext().cacheDir + '/' + fileName;
  const file: fileIo.File = fileIo.openSync(path,
    fileIo.OpenMode.CREATE | fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.TRUNC);
  try {
    fileIo.writeSync(file.fd, bytes);
  } finally {
    fileIo.closeSync(file);
  }
  return new TempWrite(path, fileIo.statSync(path).size);
}

function readTempHead(path: string, count: number): Uint8Array {
  const file: fileIo.File = fileIo.openSync(path, fileIo.OpenMode.READ_ONLY);
  try {
    const buffer: Uint8Array = new Uint8Array(count);
    fileIo.readSync(file.fd, buffer);
    return buffer;
  } finally {
    fileIo.closeSync(file);
  }
}

function removeTemp(path: string): void {
  if (fileIo.accessSync(path)) {
    fileIo.unlinkSync(path);
  }
}

export default function resourceMediaMatrixTest() {
  describe('ResourceMediaMatrix', () => {
    beforeEach(async () => {
      await paceTurn();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_0100
     * @tc.name      testStartIconPngSignature0001
     * @tc.desc      Read the start window icon by name and check the eight signature bytes, the IHDR identity and
     *               the pixel format of the header
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testStartIconPngSignature0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bytes: Uint8Array = mediaBytes(START_ICON_NAME);
      const signed: boolean = PngOracle.hasSignature(bytes);
      logCase('testStartIconPngSignature0001', `length=${bytes.length} signed=${signed} ` +
        `chunk=${PngOracle.firstChunkType(bytes)}`);
      expect(signed).assertTrue();
      expect(bytes.length).assertEqual(START_ICON_BYTES);
      expect(PngOracle.firstChunkType(bytes)).assertEqual(IHDR_TYPE);
      expect(PngOracle.bitDepth(bytes)).assertEqual(BIT_DEPTH_8);
      expect(PngOracle.colorType(bytes)).assertEqual(COLOR_TYPE_RGBA);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_0200
     * @tc.name      testStartIconHeaderBytes0001
     * @tc.desc      Inspect the raw IHDR field layout of the start window icon: payload length, compression,
     *               filter and interlace bytes plus the letter shape of the chunk name
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStartIconHeaderBytes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bytes: Uint8Array = mediaBytes(START_ICON_NAME);
      const payload: number = PngOracle.readUint32(bytes, PngOracle.SIGNATURE.length);
      const flags: number[] = [bytes[26], bytes[27], bytes[28]];
      const name: string = chunkTypeAt(bytes, PngOracle.SIGNATURE.length);
      const letters: boolean = name.split('').every((ch: string) => isAsciiLetter(ch));
      logCase('testStartIconHeaderBytes0001', `payload=${payload} flags=${flags.join(',')} name=${name} ` +
        `letters=${letters}`);
      expect(payload).assertEqual(IHDR_DATA_BYTES);
      expect(flags.every((value: number) => value === 0)).assertTrue();
      expect(letters).assertTrue();
      expect(bytes.length > PngOracle.SIGNATURE.length + CHUNK_OVERHEAD + payload).assertTrue();
      expect(bytes[PngOracle.SIGNATURE.length + 4]).assertEqual('I'.charCodeAt(0));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_0300
     * @tc.name      testStartIconSquareGeometry0001
     * @tc.desc      Check that the start window icon is a square canvas with an area that fits the packed byte
     *               count of a compressed rgba stream
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStartIconSquareGeometry0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bytes: Uint8Array = mediaBytes(START_ICON_NAME);
      const width: number = PngOracle.width(bytes);
      const height: number = PngOracle.height(bytes);
      const area: number = width * height;
      logCase('testStartIconSquareGeometry0001', `width=${width} height=${height} area=${area} ` +
        `bytes=${bytes.length}`);
      expect(width).assertEqual(SIDE_START_ICON);
      expect(height).assertEqual(SIDE_START_ICON);
      expect(width === height).assertTrue();
      expect(area).assertEqual(SIDE_START_ICON * SIDE_START_ICON);
      expect(bytes.length < area * 4).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_0400
     * @tc.name      testStartIconTrailingIend0001
     * @tc.desc      Read the final twelve bytes of the start window icon and check they form an empty IEND chunk
     *               with the fixed crc of the png specification
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStartIconTrailingIend0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bytes: Uint8Array = mediaBytes(START_ICON_NAME);
      const tailStart: number = bytes.length - CHUNK_OVERHEAD;
      const tailLength: number = PngOracle.readUint32(bytes, tailStart);
      const tailType: string = chunkTypeAt(bytes, tailStart);
      const tailCrc: number = PngOracle.readUint32(bytes, tailStart + 8);
      logCase('testStartIconTrailingIend0001', `tailStart=${tailStart} tailLength=${tailLength} ` +
        `tailType=${tailType} tailCrc=${tailCrc}`);
      expect(tailLength).assertEqual(0);
      expect(tailType).assertEqual(IEND_TYPE);
      expect(tailCrc).assertEqual(IEND_CRC);
      expect(bytes[bytes.length - 1]).assertEqual(0x82);
      expect(chunkTypeAt(bytes, bytes.length - CHUNK_OVERHEAD)).assertEqual(IEND_TYPE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_0500
     * @tc.name      testStartIconChunkSequence0001
     * @tc.desc      Walk every chunk of the start window icon and check the exact order IHDR, gAMA, eXIf, two
     *               IDAT parts and IEND
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStartIconChunkSequence0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bytes: Uint8Array = mediaBytes(START_ICON_NAME);
      const types: string[] = chunkTypes(bytes);
      logCase('testStartIconChunkSequence0001', `count=${types.length} order=${types.join(',')}`);
      expect(types.join(',')).assertEqual(START_ICON_CHUNK_ORDER);
      expect(types.length).assertEqual(START_ICON_CHUNK_COUNT);
      expect(types[0]).assertEqual(IHDR_TYPE);
      expect(types[types.length - 1]).assertEqual(IEND_TYPE);
      expect(chunkTypeCount(bytes, IDAT_TYPE)).assertEqual(START_ICON_IDAT_COUNT);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_0600
     * @tc.name      testStartIconIdatPayload0001
     * @tc.desc      Sum the payload of the two IDAT chunks of the start window icon and check the total equals the
     *               file size minus the signature and the five other chunk wrappers
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStartIconIdatPayload0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bytes: Uint8Array = mediaBytes(START_ICON_NAME);
      const idatBytes: number = chunkDataBytes(bytes, IDAT_TYPE);
      const idatCount: number = chunkTypeCount(bytes, IDAT_TYPE);
      const wrapperBytes: number = bytes.length - PngOracle.SIGNATURE.length - idatBytes;
      logCase('testStartIconIdatPayload0001', `idatBytes=${idatBytes} idatCount=${idatCount} ` +
        `wrapperBytes=${wrapperBytes}`);
      expect(idatCount).assertEqual(START_ICON_IDAT_COUNT);
      expect(idatBytes).assertEqual(START_ICON_IDAT_BYTES);
      expect(wrapperBytes).assertEqual(START_ICON_CHUNK_COUNT * CHUNK_OVERHEAD + IHDR_DATA_BYTES + 4 + 56);
      expect(idatBytes < bytes.length).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_0700
     * @tc.name      testStartIconIhdrCrc0001
     * @tc.desc      Recompute the crc32 of the IHDR name and payload of the start window icon and compare it with
     *               the crc field the encoder wrote behind the chunk
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStartIconIhdrCrc0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const bytes: Uint8Array = mediaBytes(START_ICON_NAME);
      const header: PngChunk | undefined = firstChunk(bytes);
      const stored: number = header === undefined ? 0 : chunkStoredCrc(bytes, header);
      const computed: number = header === undefined ? 1 : chunkComputedCrc(bytes, header);
      logCase('testStartIconIhdrCrc0001', `stored=${stored} computed=${computed}`);
      expect(header === undefined).assertFalse();
      expect(stored).assertEqual(computed);
      expect(stored > 0).assertTrue();
      expect(stored >>> 24).assertEqual(0xE7);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_0800
     * @tc.name      testStartIconAncillaryAbsence0001
     * @tc.desc      Check that the start window icon carries no transparency, palette, significant bit or
     *               background chunk, which a plain rgba image never needs
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStartIconAncillaryAbsence0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const bytes: Uint8Array = mediaBytes(START_ICON_NAME);
      const transparency: number = chunkTypeCount(bytes, 'tRNS');
      const palette: number = chunkTypeCount(bytes, 'PLTE');
      const significantBits: number = chunkTypeCount(bytes, 'sBIT');
      const backgroundHint: number = chunkTypeCount(bytes, 'bKGD');
      logCase('testStartIconAncillaryAbsence0001', `tRNS=${transparency} PLTE=${palette} ` +
        `sBIT=${significantBits} bKGD=${backgroundHint}`);
      expect(transparency).assertEqual(0);
      expect(palette).assertEqual(0);
      expect(significantBits).assertEqual(0);
      expect(backgroundHint).assertEqual(0);
      expect(chunkTypeCount(bytes, IHDR_TYPE)).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_0900
     * @tc.name      testStartIconChunkArithmetic0001
     * @tc.desc      Check that the chunk wrappers of the start window icon tile the file exactly: contiguous
     *               offsets, no gap and the last wrapper ending on the file size
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStartIconChunkArithmetic0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const bytes: Uint8Array = mediaBytes(START_ICON_NAME);
      const chunks: PngChunk[] = chunkList(bytes);
      let covered: number = PngOracle.SIGNATURE.length;
      let contiguous: boolean = true;
      for (const chunk of chunks) {
        if (chunk.offset !== covered) {
          contiguous = false;
        }
        covered = covered + CHUNK_OVERHEAD + chunk.dataLength;
      }
      logCase('testStartIconChunkArithmetic0001', `chunks=${chunks.length} covered=${covered} ` +
        `length=${bytes.length} contiguous=${contiguous}`);
      expect(contiguous).assertTrue();
      expect(covered).assertEqual(bytes.length);
      expect(chunks.length).assertEqual(START_ICON_CHUNK_COUNT);
      expect(chunks[chunks.length - 1].offset + CHUNK_OVERHEAD).assertEqual(bytes.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_1000
     * @tc.name      testStartIconWindowIdRead0001
     * @tc.desc      Read the media id the ability info publishes and check the id based payload is the layered
     *               description while the start window icon keeps its own packed bytes and canvas
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStartIconWindowIdRead0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const ability: bundleManager.AbilityInfo = await entryAbilityInfo();
      const byId: Uint8Array = resources().getMediaContentSync(ability.iconId);
      const startIcon: Uint8Array = mediaBytes(START_ICON_NAME);
      const layered: Uint8Array = mediaBytes(LAYERED_NAME);
      logCase('testStartIconWindowIdRead0001', `iconId=${ability.iconId} icon=${ability.icon} ` +
        `idLength=${byId.length} startLength=${startIcon.length}`);
      expect(ability.iconId > 0).assertTrue();
      expect(sameBytes(byId, layered)).assertTrue();
      expect(sameBytes(startIcon, byId)).assertFalse();
      expect(startIcon.length).assertEqual(START_ICON_BYTES);
      expect(PngOracle.width(startIcon)).assertEqual(SIDE_START_ICON);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_1100
     * @tc.name      testStartIconIdHeader0001
     * @tc.desc      Repeat the header inspection on the start window icon read by name and check the id based read
     *               of the ability icon returns the layered description text instead of a png stream
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStartIconIdHeader0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const ability: bundleManager.AbilityInfo = await entryAbilityInfo();
      const iconById: Uint8Array = resources().getMediaContentSync(ability.iconId);
      const bytes: Uint8Array = mediaBytes(START_ICON_NAME);
      const header: PngChunk | undefined = firstChunk(bytes);
      logCase('testStartIconIdHeader0001', `iconId=${ability.iconId} iconLength=${iconById.length} ` +
        `idatBytes=${chunkDataBytes(bytes, IDAT_TYPE)} headerOffset=${header === undefined ? -1 : header.offset}`);
      expect(iconById.length).assertEqual(mediaBytes(LAYERED_NAME).length);
      expect(PngOracle.hasSignature(bytes)).assertTrue();
      expect(PngOracle.width(bytes)).assertEqual(SIDE_START_ICON);
      expect(PngOracle.height(bytes)).assertEqual(SIDE_START_ICON);
      expect(header === undefined ? -1 : header.dataLength).assertEqual(IHDR_DATA_BYTES);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_1200
     * @tc.name      testBackgroundPngSignature0001
     * @tc.desc      Read the background layer by name and check signature, first chunk name and both colour format
     *               fields of the header
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBackgroundPngSignature0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bytes: Uint8Array = mediaBytes(BACKGROUND_NAME);
      const layered: Uint8Array = mediaBytes(LAYERED_NAME);
      const leading: number[] = [bytes[0], bytes[1], bytes[2], bytes[3]];
      const expected: number[] = PngOracle.SIGNATURE.slice(0, 4);
      logCase('testBackgroundPngSignature0001', `leading=${leading.join(',')} expected=${expected.join(',')} ` +
        `layeredSigned=${PngOracle.hasSignature(layered)}`);
      expect(PngOracle.hasSignature(bytes)).assertTrue();
      expect(PngOracle.hasSignature(layered)).assertFalse();
      expect(leading.join(',')).assertEqual(expected.join(','));
      expect(PngOracle.bitDepth(bytes)).assertEqual(BIT_DEPTH_8);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_1300
     * @tc.name      testBackgroundSquareGeometry0001
     * @tc.desc      Check the background layer was packed as a 512 px square and that its area times four channels
     *               stays above the packed byte count
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundSquareGeometry0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const background: Uint8Array = mediaBytes(BACKGROUND_NAME);
      const foreground: Uint8Array = mediaBytes(FOREGROUND_NAME);
      const side: number = PngOracle.width(background);
      const area: number = side * PngOracle.height(background);
      logCase('testBackgroundSquareGeometry0001', `side=${side} area=${area} ` +
        `foregroundHeight=${PngOracle.height(foreground)} foregroundLength=${foreground.length}`);
      expect(side).assertEqual(SIDE_LAYER);
      expect(PngOracle.height(background)).assertEqual(SIDE_LAYER);
      expect(area).assertEqual(SIDE_LAYER * SIDE_LAYER);
      expect(PngOracle.height(foreground)).assertEqual(PngOracle.height(background));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_1400
     * @tc.name      testBackgroundTrailingIend0001
     * @tc.desc      Walk to the last chunk of the background layer by offset arithmetic and check it is an empty
     *               IEND chunk with the canonical crc
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundTrailingIend0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bytes: Uint8Array = mediaBytes(BACKGROUND_NAME);
      const last: PngChunk | undefined = lastChunk(bytes);
      const offset: number = last === undefined ? -1 : last.offset;
      logCase('testBackgroundTrailingIend0001', `lastType=${last === undefined ? 'none' : last.type} ` +
        `offset=${offset} tail=${bytes.length - CHUNK_OVERHEAD}`);
      expect(last === undefined).assertFalse();
      expect(offset).assertEqual(bytes.length - CHUNK_OVERHEAD);
      expect(last === undefined ? EMPTY_TEXT : last.type).assertEqual(IEND_TYPE);
      expect(PngOracle.readUint32(bytes, offset + 8)).assertEqual(IEND_CRC);
      expect(last === undefined ? -1 : last.dataLength).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_1500
     * @tc.name      testBackgroundIdatPayload0001
     * @tc.desc      Check the background layer carries compressed pixel data: at least one IDAT part and a payload
     *               total that is a proper fraction of the file
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundIdatPayload0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bytes: Uint8Array = mediaBytes(BACKGROUND_NAME);
      const idatCount: number = chunkTypeCount(bytes, IDAT_TYPE);
      const idatBytes: number = chunkDataBytes(bytes, IDAT_TYPE);
      logCase('testBackgroundIdatPayload0001', `idatCount=${idatCount} idatBytes=${idatBytes} ` +
        `length=${bytes.length} share=${idatBytes / bytes.length}`);
      expect(idatCount >= 1).assertTrue();
      expect(idatBytes > 0).assertTrue();
      expect(idatBytes < bytes.length).assertTrue();
      expect(idatBytes / bytes.length > 0.9).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_1600
     * @tc.name      testBackgroundHeaderFlags0001
     * @tc.desc      Read the three flag bytes of the background header and check the thirteen byte IHDR payload
     *               together with the deflate method markers
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackgroundHeaderFlags0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const bytes: Uint8Array = mediaBytes(BACKGROUND_NAME);
      const payload: number = PngOracle.readUint32(bytes, PngOracle.SIGNATURE.length);
      const compression: number = bytes[26];
      const filter: number = bytes[27];
      const interlace: number = bytes[28];
      logCase('testBackgroundHeaderFlags0001', `payload=${payload} compression=${compression} filter=${filter} ` +
        `interlace=${interlace}`);
      expect(payload).assertEqual(IHDR_DATA_BYTES);
      expect(compression).assertEqual(0);
      expect(filter).assertEqual(0);
      expect(interlace).assertEqual(0);
      expect(chunkTypeAt(bytes, PngOracle.SIGNATURE.length)).assertEqual(IHDR_TYPE);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_1700
     * @tc.name      testBackgroundChunkArithmetic0001
     * @tc.desc      Rebuild the background file size from its chunk wrappers and check only the terminal chunk
     *               carries an empty payload while no chunk claims bytes outside the buffer
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackgroundChunkArithmetic0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const bytes: Uint8Array = mediaBytes(BACKGROUND_NAME);
      const chunks: PngChunk[] = chunkList(bytes);
      let rebuilt: number = PngOracle.SIGNATURE.length;
      let oversized: number = 0;
      for (const chunk of chunks) {
        rebuilt = rebuilt + CHUNK_OVERHEAD + chunk.dataLength;
        if (chunk.offset + CHUNK_OVERHEAD + chunk.dataLength > bytes.length) {
          oversized = oversized + 1;
        }
      }
      const empty: number = chunks.filter((chunk: PngChunk) => chunk.dataLength === 0).length;
      logCase('testBackgroundChunkArithmetic0001', `chunks=${chunks.length} rebuilt=${rebuilt} ` +
        `length=${bytes.length} empty=${empty} oversized=${oversized}`);
      expect(rebuilt).assertEqual(bytes.length);
      expect(oversized).assertEqual(0);
      expect(empty).assertEqual(1);
      expect(chunks.length > 2).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_1800
     * @tc.name      testBackgroundIhdrCrc0001
     * @tc.desc      Verify the background header crc three ways: the recomputed value, the stored field through the
     *               oracle and the stored field through the multiplication based decoder
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackgroundIhdrCrc0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const bytes: Uint8Array = mediaBytes(BACKGROUND_NAME);
      const header: PngChunk | undefined = firstChunk(bytes);
      const stored: number = header === undefined ? 0 : chunkStoredCrc(bytes, header);
      const manual: number = header === undefined ? 1 : bigEndian32(bytes, header.offset + 8 + header.dataLength);
      const computed: number = header === undefined ? 2 : chunkComputedCrc(bytes, header);
      logCase('testBackgroundIhdrCrc0001', `stored=${stored} manual=${manual} computed=${computed}`);
      expect(stored).assertEqual(manual);
      expect(stored).assertEqual(computed);
      expect(stored !== IEND_CRC).assertTrue();
      expect(stored > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_1900
     * @tc.name      testBackgroundLayerIdRead0001
     * @tc.desc      Take the background reference out of the layered image description, resolve it and check the
     *               result matches the background media read by name
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundLayerIdRead0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const reference: string = layeredReference(BACKGROUND_NAME);
      const target: string = refTarget(reference);
      const byRef: Uint8Array = layerBytes(reference);
      const byName: Uint8Array = mediaBytes(BACKGROUND_NAME);
      logCase('testBackgroundLayerIdRead0001', `reference=${reference} target=${target} ` +
        `refWidth=${PngOracle.width(byRef)} nameWidth=${PngOracle.width(byName)}`);
      expect(isDigits(target) || target === BACKGROUND_NAME).assertTrue();
      expect(PngOracle.width(byRef)).assertEqual(PngOracle.width(byName));
      expect(byRef.length).assertEqual(byName.length);
      expect(PngOracle.hasSignature(byRef)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_2000
     * @tc.name      testBackgroundIndependentDecode0001
     * @tc.desc      Decode the background width and height with a multiplication based decoder and check the raw
     *               header bytes a 512 px canvas must contain
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundIndependentDecode0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bytes: Uint8Array = mediaBytes(BACKGROUND_NAME);
      const width: number = bigEndian32(bytes, 16);
      const height: number = bigEndian32(bytes, 20);
      logCase('testBackgroundIndependentDecode0001', `width=${width} height=${height} ` +
        `highByte=${bytes[16]} lowByte=${bytes[19]}`);
      expect(width).assertEqual(PngOracle.width(bytes));
      expect(height).assertEqual(PngOracle.height(bytes));
      expect(width).assertEqual(SIDE_LAYER);
      expect(bytes[16]).assertEqual(0);
      expect(bytes[19]).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_2100
     * @tc.name      testLayerPairGeometry0001
     * @tc.desc      Compare the two layered png files: equal canvas, different payload and therefore different
     *               content, both still valid png streams
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLayerPairGeometry0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const background: Uint8Array = mediaBytes(BACKGROUND_NAME);
      const foreground: Uint8Array = mediaBytes(FOREGROUND_NAME);
      const headerBytes: number = PngOracle.SIGNATURE.length + CHUNK_OVERHEAD + IHDR_DATA_BYTES;
      logCase('testLayerPairGeometry0001', `background=${background.length} foreground=${foreground.length} ` +
        `headersEqual=${sameBytes(prefixBytes(background, headerBytes), prefixBytes(foreground, headerBytes))}`);
      expect(sameBytes(prefixBytes(background, headerBytes), prefixBytes(foreground, headerBytes))).assertTrue();
      expect(sameBytes(background, foreground)).assertFalse();
      expect(background.length !== foreground.length).assertTrue();
      expect(headerBytes).assertEqual(33);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_2200
     * @tc.name      testBackgroundRepeatedReads0001
     * @tc.desc      Read the background three times in a row and check the payload, the length and the leading
     *               signature prefix never drift between reads
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackgroundRepeatedReads0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const first: Uint8Array = mediaBytes(BACKGROUND_NAME);
      const second: Uint8Array = mediaBytes(BACKGROUND_NAME);
      const third: Uint8Array = mediaBytes(BACKGROUND_NAME);
      logCase('testBackgroundRepeatedReads0001', `lengths=${first.length},${second.length},${third.length} ` +
        `same12=${sameBytes(first, second)} same23=${sameBytes(second, third)}`);
      expect(first.length).assertEqual(second.length);
      expect(second.length).assertEqual(third.length);
      expect(sameBytes(first, second)).assertTrue();
      expect(sameBytes(second, third)).assertTrue();
      expect(sameBytes(prefixBytes(first, 8), prefixBytes(third, 8))).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_2300
     * @tc.name      testBackgroundCompressionBound0001
     * @tc.desc      Check the packed background stays below a quarter of the uncompressed rgba size and above a
     *               minimum that a textured layer cannot undercut
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackgroundCompressionBound0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const bytes: Uint8Array = mediaBytes(BACKGROUND_NAME);
      const raw: number = PngOracle.width(bytes) * PngOracle.height(bytes) * 4;
      const share: number = bytes.length / raw;
      logCase('testBackgroundCompressionBound0001', `length=${bytes.length} raw=${raw} share=${share}`);
      expect(raw > bytes.length).assertTrue();
      expect(share < 0.25).assertTrue();
      expect(share > 0.001).assertTrue();
      expect(bytes.length >= BACKGROUND_MIN_BYTES).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_2400
     * @tc.name      testForegroundPngSignature0001
     * @tc.desc      Read the foreground layer by name and check signature, header identity, pixel format and the
     *               minimum plausible payload of the icon layer
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testForegroundPngSignature0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bytes: Uint8Array = mediaBytes(FOREGROUND_NAME);
      const background: Uint8Array = mediaBytes(BACKGROUND_NAME);
      logCase('testForegroundPngSignature0001', `length=${bytes.length} ` +
        `idat=${chunkTypeCount(bytes, IDAT_TYPE)} headers=${chunkTypeCount(bytes, IHDR_TYPE)}`);
      expect(PngOracle.hasSignature(bytes)).assertTrue();
      expect(chunkTypeCount(bytes, IDAT_TYPE) >= 1).assertTrue();
      expect(chunkTypeCount(bytes, IHDR_TYPE)).assertEqual(1);
      expect(bytes.length >= FOREGROUND_MIN_BYTES).assertTrue();
      expect(PngOracle.hasSignature(background)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_2500
     * @tc.name      testForegroundSquareGeometry0001
     * @tc.desc      Check the foreground canvas is 512 px square and that the id based read of the same layer
     *               reports identical geometry
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testForegroundSquareGeometry0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const byName: Uint8Array = mediaBytes(FOREGROUND_NAME);
      const byRef: Uint8Array = layerBytes(layeredReference(FOREGROUND_NAME));
      logCase('testForegroundSquareGeometry0001', `nameWidth=${PngOracle.width(byName)} ` +
        `refWidth=${PngOracle.width(byRef)} nameHeight=${PngOracle.height(byName)}`);
      expect(PngOracle.width(byName)).assertEqual(SIDE_LAYER);
      expect(PngOracle.height(byName)).assertEqual(SIDE_LAYER);
      expect(PngOracle.width(byRef)).assertEqual(PngOracle.width(byName));
      expect(PngOracle.height(byRef)).assertEqual(PngOracle.height(byName));
      expect(PngOracle.width(byName) * PngOracle.height(byName)).assertEqual(SIDE_LAYER * SIDE_LAYER);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_2600
     * @tc.name      testForegroundIhdrCrc0001
     * @tc.desc      Sweep the stored crc field of the foreground header and of every one of its IDAT parts against
     *               the recomputed value
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testForegroundIhdrCrc0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const bytes: Uint8Array = mediaBytes(FOREGROUND_NAME);
      const verified: PngChunk[] = chunkList(bytes)
        .filter((chunk: PngChunk) => chunk.type === IHDR_TYPE || chunk.type === IDAT_TYPE);
      const mismatched: string[] = verified
        .filter((chunk: PngChunk) => chunkStoredCrc(bytes, chunk) !== chunkComputedCrc(bytes, chunk))
        .map((chunk: PngChunk) => chunk.type);
      logCase('testForegroundIhdrCrc0001', `verified=${verified.length} mismatched=${mismatched.join(',')}`);
      expect(verified.length >= 2).assertTrue();
      expect(mismatched.length).assertEqual(0);
      expect(chunkTypeCount(bytes, IHDR_TYPE)).assertEqual(1);
      expect(chunkStoredCrc(bytes, verified[0]) > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_2700
     * @tc.name      testForegroundChunkTypeLetters0001
     * @tc.desc      Check every chunk name of the foreground is made of ascii letters only and that the stream both
     *               opens with IHDR and closes with IEND
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testForegroundChunkTypeLetters0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const bytes: Uint8Array = mediaBytes(FOREGROUND_NAME);
      const types: string[] = chunkTypes(bytes);
      const badNames: string[] = types
        .filter((type: string) => !type.split('').every((ch: string) => isAsciiLetter(ch)));
      logCase('testForegroundChunkTypeLetters0001', `types=${types.join(',')} badNames=${badNames.join(',')}`);
      expect(badNames.length).assertEqual(0);
      expect(types[0]).assertEqual(IHDR_TYPE);
      expect(types[types.length - 1]).assertEqual(IEND_TYPE);
      expect(chunkTypeCount(bytes, IDAT_TYPE) >= 1).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_2800
     * @tc.name      testForegroundLayerIdRead0001
     * @tc.desc      Resolve the foreground reference of the layered description and check it yields the same png
     *               payload and pixel format as the lookup by name
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testForegroundLayerIdRead0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const reference: string = layeredReference(FOREGROUND_NAME);
      const byRef: Uint8Array = layerBytes(reference);
      const byName: Uint8Array = mediaBytes(FOREGROUND_NAME);
      logCase('testForegroundLayerIdRead0001', `reference=${reference} refLength=${byRef.length} ` +
        `nameLength=${byName.length}`);
      expect(reference.startsWith(MEDIA_PREFIX)).assertTrue();
      expect(sameBytes(byRef, byName)).assertTrue();
      expect(PngOracle.colorType(byRef)).assertEqual(COLOR_TYPE_RGBA);
      expect(byRef.length).assertEqual(byName.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_2900
     * @tc.name      testForegroundAsyncParity0001
     * @tc.desc      Read the foreground through the promise api and compare the resolved array with the synchronous
     *               read byte by byte
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testForegroundAsyncParity0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const asyncForeground: Uint8Array = await resources().getMediaByName(FOREGROUND_NAME);
      const asyncBackground: Uint8Array = await resources().getMediaByName(BACKGROUND_NAME);
      const syncForeground: Uint8Array = mediaBytes(FOREGROUND_NAME);
      logCase('testForegroundAsyncParity0001', `foreground=${asyncForeground.length} ` +
        `background=${asyncBackground.length} sync=${syncForeground.length}`);
      expect(sameBytes(asyncForeground, syncForeground)).assertTrue();
      expect(sameBytes(asyncForeground, asyncBackground)).assertFalse();
      expect(asyncForeground.length !== asyncBackground.length).assertTrue();
      expect(PngOracle.width(asyncForeground)).assertEqual(PngOracle.width(asyncBackground));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_3000
     * @tc.name      testForegroundVersusStartIcon0001
     * @tc.desc      Contrast the layered foreground with the start window icon: different canvas, different payload
     *               and different resource role, both still carrying a valid png signature
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testForegroundVersusStartIcon0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const foreground: Uint8Array = mediaBytes(FOREGROUND_NAME);
      const startIcon: Uint8Array = mediaBytes(START_ICON_NAME);
      logCase('testForegroundVersusStartIcon0001', `foregroundWidth=${PngOracle.width(foreground)} ` +
        `startIconWidth=${PngOracle.width(startIcon)} foregroundBytes=${foreground.length}`);
      expect(PngOracle.width(foreground) !== PngOracle.width(startIcon)).assertTrue();
      expect(foreground.length !== startIcon.length).assertTrue();
      expect(sameBytes(foreground, startIcon)).assertFalse();
      expect(PngOracle.hasSignature(startIcon)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_3100
     * @tc.name      testForegroundTrailingIend0001
     * @tc.desc      Locate the closing chunk of the foreground through the walked chunk list and check its offset,
     *               empty payload and canonical crc
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testForegroundTrailingIend0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bytes: Uint8Array = mediaBytes(FOREGROUND_NAME);
      const chunks: PngChunk[] = chunkList(bytes);
      const closing: PngChunk = chunks[chunks.length - 1];
      const typeCrc: number = crc32(bytes, closing.offset + 4, 4);
      const emptyChunks: number = chunks.filter((chunk: PngChunk) => chunk.dataLength === 0).length;
      logCase('testForegroundTrailingIend0001', `closing=${closing.type} typeCrc=${typeCrc} ` +
        `stored=${chunkStoredCrc(bytes, closing)} emptyChunks=${emptyChunks}`);
      expect(closing.type).assertEqual(IEND_TYPE);
      expect(typeCrc).assertEqual(chunkStoredCrc(bytes, closing));
      expect(typeCrc).assertEqual(IEND_CRC);
      expect(emptyChunks).assertEqual(1);
      expect(closing.offset + CHUNK_OVERHEAD <= bytes.length).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_3200
     * @tc.name      testForegroundChunkSpan0001
     * @tc.desc      Verify every chunk crc of the foreground and check the chunk offsets strictly increase while the
     *               last wrapper still lands on the exact file size
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testForegroundChunkSpan0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const bytes: Uint8Array = mediaBytes(FOREGROUND_NAME);
      const chunks: PngChunk[] = chunkList(bytes);
      let ascending: boolean = true;
      let previous: number = -1;
      let badCrc: number = 0;
      for (const chunk of chunks) {
        if (chunk.offset <= previous) {
          ascending = false;
        }
        previous = chunk.offset;
        if (chunkStoredCrc(bytes, chunk) !== chunkComputedCrc(bytes, chunk)) {
          badCrc = badCrc + 1;
        }
      }
      logCase('testForegroundChunkSpan0001', `chunks=${chunks.length} ascending=${ascending} badCrc=${badCrc} ` +
        `lastEnd=${previous + CHUNK_OVERHEAD}`);
      expect(ascending).assertTrue();
      expect(badCrc).assertEqual(0);
      expect(previous + CHUNK_OVERHEAD).assertEqual(bytes.length);
      expect(chunks.length >= 3).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_3300
     * @tc.name      testForegroundChannelModel0001
     * @tc.desc      Derive the channel count and the bits per pixel from the foreground header and check the
     *               implied raw stream is larger than the packed payload
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testForegroundChannelModel0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const bytes: Uint8Array = mediaBytes(FOREGROUND_NAME);
      const colorType: number = PngOracle.colorType(bytes);
      const channels: number = colorType === COLOR_TYPE_RGBA ? 4 : 0;
      const bitsPerPixel: number = PngOracle.bitDepth(bytes) * channels;
      const rawBytes: number = PngOracle.width(bytes) * PngOracle.height(bytes) * channels +
        PngOracle.height(bytes);
      logCase('testForegroundChannelModel0001', `colorType=${colorType} channels=${channels} ` +
        `bitsPerPixel=${bitsPerPixel} rawBytes=${rawBytes}`);
      expect(channels).assertEqual(4);
      expect(bitsPerPixel).assertEqual(32);
      expect(rawBytes > bytes.length).assertTrue();
      expect(rawBytes).assertEqual(SIDE_LAYER * SIDE_LAYER * 4 + SIDE_LAYER);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_3400
     * @tc.name      testForegroundCompressionRatio0001
     * @tc.desc      Bound the foreground payload between the fixed chunk overhead and half of its raw stream and
     *               check the two derived ratios agree
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testForegroundCompressionRatio0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const bytes: Uint8Array = mediaBytes(FOREGROUND_NAME);
      const overhead: number = PngOracle.SIGNATURE.length + CHUNK_OVERHEAD + IHDR_DATA_BYTES;
      const rawBytes: number = (PngOracle.width(bytes) * 4 + 1) * PngOracle.height(bytes);
      const share: number = bytes.length / rawBytes;
      logCase('testForegroundCompressionRatio0001', `length=${bytes.length} overhead=${overhead} ` +
        `rawBytes=${rawBytes} share=${share}`);
      expect(bytes.length > overhead).assertTrue();
      expect(share < 0.5).assertTrue();
      expect(share > 0.001).assertTrue();
      expect(chunkDataBytes(bytes, IDAT_TYPE) < rawBytes).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_3500
     * @tc.name      testLayeredTextShape0001
     * @tc.desc      Decode the layered image description and check it is a one byte per character ascii document
     *               delimited by braces and free of any png signature
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testLayeredTextShape0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const bytes: Uint8Array = mediaBytes(LAYERED_NAME);
      const text: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      logCase('testLayeredTextShape0001', `bytes=${bytes.length} text=${text.length} ` +
        `head=${text.charAt(0)} tail=${text.charAt(text.length - 1)}`);
      expect(text.length).assertEqual(bytes.length);
      expect(text.charAt(0)).assertEqual(BRACE_OPEN);
      expect(text.charAt(text.length - 1)).assertEqual(BRACE_CLOSE);
      expect(PngOracle.hasSignature(bytes)).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_3600
     * @tc.name      testLayeredPairInventory0001
     * @tc.desc      Scan the layered image description into members and check the member inventory: the wrapper key
     *               plus exactly one background and one foreground entry
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLayeredPairInventory0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const pairs: JsonPair[] = layeredPairs();
      const keys: string[] = pairs.map((pair: JsonPair) => pair.key);
      const mediaPairs: JsonPair[] = pairs.filter((pair: JsonPair) => pair.value.startsWith(MEDIA_PREFIX));
      logCase('testLayeredPairInventory0001', `pairs=${pairs.length} keys=${keys.join(',')} ` +
        `mediaPairs=${mediaPairs.length}`);
      expect(pairs.length).assertEqual(3);
      expect(pairCount(pairs, LAYER_KEY)).assertEqual(1);
      expect(pairCount(pairs, BACKGROUND_NAME)).assertEqual(1);
      expect(pairCount(pairs, FOREGROUND_NAME)).assertEqual(1);
      expect(mediaPairs.length).assertEqual(2);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_3700
     * @tc.name      testLayeredReferenceSyntax0001
     * @tc.desc      Check both layer values are media references with a non empty body and that the two bodies point
     *               at different resources
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLayeredReferenceSyntax0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const backgroundRef: string = layeredReference(BACKGROUND_NAME);
      const foregroundRef: string = layeredReference(FOREGROUND_NAME);
      const backgroundTarget: string = refTarget(backgroundRef);
      const foregroundTarget: string = refTarget(foregroundRef);
      logCase('testLayeredReferenceSyntax0001', `background=${backgroundRef} foreground=${foregroundRef} ` +
        `targets=${backgroundTarget}/${foregroundTarget}`);
      expect(backgroundRef.startsWith(MEDIA_PREFIX)).assertTrue();
      expect(foregroundRef.startsWith(MEDIA_PREFIX)).assertTrue();
      expect(backgroundTarget.length > 0 && foregroundTarget.length > 0).assertTrue();
      expect(backgroundTarget === foregroundTarget).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_3800
     * @tc.name      testLayeredReferenceResolution0001
     * @tc.desc      Resolve both layer references and check each equals the png fetched by the layer name, so the
     *               rewritten id form and the name form agree
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLayeredReferenceResolution0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const backgroundByRef: Uint8Array = layerBytes(layeredReference(BACKGROUND_NAME));
      const foregroundByRef: Uint8Array = layerBytes(layeredReference(FOREGROUND_NAME));
      logCase('testLayeredReferenceResolution0001', `backgroundRefLength=${backgroundByRef.length} ` +
        `foregroundRefLength=${foregroundByRef.length}`);
      expect(sameBytes(backgroundByRef, mediaBytes(BACKGROUND_NAME))).assertTrue();
      expect(sameBytes(foregroundByRef, mediaBytes(FOREGROUND_NAME))).assertTrue();
      expect(backgroundByRef.length !== foregroundByRef.length).assertTrue();
      expect(PngOracle.hasSignature(foregroundByRef)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_3900
     * @tc.name      testLayeredBraceBalance0001
     * @tc.desc      Check the layered description text is brace balanced, has an even number of quotes and uses
     *               neither tab nor carriage return formatting
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLayeredBraceBalance0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const text: string = mediaText(LAYERED_NAME);
      const open: number = countChar(text, BRACE_OPEN);
      const close: number = countChar(text, BRACE_CLOSE);
      const quotes: number = countChar(text, QUOTE);
      logCase('testLayeredBraceBalance0001', `open=${open} close=${close} quotes=${quotes} ` +
        `tabs=${countChar(text, '\t')} returns=${countChar(text, '\r')}`);
      expect(open).assertEqual(close);
      expect(open >= 2).assertTrue();
      expect(quotes % 2).assertEqual(0);
      expect(countChar(text, '\t')).assertEqual(0);
      expect(countChar(text, '\r')).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_4000
     * @tc.name      testLayeredIconIdRead0001
     * @tc.desc      Read the ability icon through its published id and check it returns the layered description
     *               bytes, that the icon id differs from the label id and the declared icon string is a media
     *               reference
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLayeredIconIdRead0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const ability: bundleManager.AbilityInfo = await entryAbilityInfo();
      const byId: Uint8Array = resources().getMediaContentSync(ability.iconId);
      const byIdText: string = util.TextDecoder.create('utf-8').decodeToString(byId);
      logCase('testLayeredIconIdRead0001', `iconId=${ability.iconId} icon=${ability.icon}` +
        ` idLength=${byId.length} textLength=${byIdText.length}`);
      expect(byIdText === mediaText(LAYERED_NAME)).assertTrue();
      expect(byId.length).assertEqual(mediaBytes(LAYERED_NAME).length);
      expect(ability.iconId !== ability.labelId).assertTrue();
      expect(ability.icon.startsWith(MEDIA_PREFIX)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_4100
     * @tc.name      testLayeredWrapperValue0001
     * @tc.desc      Check the layered description nests both layers under the quoted 'layered-image' wrapper whose
     *               value token opens an object
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLayeredWrapperValue0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const text: string = mediaText(LAYERED_NAME);
      const pairs: JsonPair[] = scanPairs(text);
      const wrapper: string = pairValue(pairs, LAYER_KEY);
      const backgroundAt: number = text.indexOf(QUOTE + BACKGROUND_NAME + QUOTE);
      logCase('testLayeredWrapperValue0001', `wrapper=${wrapper} wrapperCount=${pairCount(pairs, LAYER_KEY)} ` +
        `backgroundAt=${backgroundAt}`);
      expect(wrapper).assertEqual(BRACE_OPEN);
      expect(pairCount(pairs, LAYER_KEY)).assertEqual(1);
      expect(text.indexOf(QUOTE + LAYER_KEY + QUOTE) > 0).assertTrue();
      expect(backgroundAt > text.indexOf(QUOTE + LAYER_KEY + QUOTE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_4200
     * @tc.name      testLayeredLengthBounds0001
     * @tc.desc      Check the layered description is a small text blob: at least the two brace bytes, below half a
     *               kilobyte, and every reference body carries at least one character
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLayeredLengthBounds0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bytes: Uint8Array = mediaBytes(LAYERED_NAME);
      const text: string = util.TextDecoder.create('utf-8').decodeToString(bytes);
      const bodies: number[] = [refTarget(layeredReference(BACKGROUND_NAME)).length,
        refTarget(layeredReference(FOREGROUND_NAME)).length];
      logCase('testLayeredLengthBounds0001', `bytes=${bytes.length} text=${text.length} bodies=${bodies.join(',')}`);
      expect(bytes.length).assertEqual(text.length);
      expect(bytes.length >= LAYER_MIN_BYTES).assertTrue();
      expect(bytes.length < LAYER_MAX_BYTES).assertTrue();
      expect(bodies.every((size: number) => size >= 1)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_4300
     * @tc.name      testLayeredPairOrder0001
     * @tc.desc      Check the textual order of the description members: the wrapper first, then the background
     *               member, then the foreground member
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLayeredPairOrder0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const text: string = mediaText(LAYERED_NAME);
      const wrapperAt: number = text.indexOf(QUOTE + LAYER_KEY + QUOTE);
      const backgroundAt: number = text.indexOf(QUOTE + BACKGROUND_NAME + QUOTE);
      const foregroundAt: number = text.indexOf(QUOTE + FOREGROUND_NAME + QUOTE);
      logCase('testLayeredPairOrder0001', `wrapperAt=${wrapperAt} backgroundAt=${backgroundAt} ` +
        `foregroundAt=${foregroundAt}`);
      expect(wrapperAt >= 0).assertTrue();
      expect(backgroundAt > wrapperAt).assertTrue();
      expect(foregroundAt > backgroundAt).assertTrue();
      expect(foregroundAt < text.length).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_4400
     * @tc.name      testLayeredStableDecode0001
     * @tc.desc      Decode the layered description three times and check the text, the member count and both
     *               reference strings stay identical
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLayeredStableDecode0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const first: Uint8Array = mediaBytes(LAYERED_NAME);
      const second: Uint8Array = mediaBytes(LAYERED_NAME);
      const firstText: string = util.TextDecoder.create('utf-8').decodeToString(first);
      const secondText: string = util.TextDecoder.create('utf-8').decodeToString(second);
      logCase('testLayeredStableDecode0001', `first=${first.length} second=${second.length} ` +
        `textEqual=${firstText === secondText} pairCount=${scanPairs(secondText).length}`);
      expect(sameBytes(first, second)).assertTrue();
      expect(firstText === secondText).assertTrue();
      expect(scanPairs(firstText).length).assertEqual(scanPairs(secondText).length);
      expect(pairValue(scanPairs(firstText), BACKGROUND_NAME))
        .assertEqual(pairValue(scanPairs(secondText), BACKGROUND_NAME));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_4500
     * @tc.name      testLayeredTargetForm0001
     * @tc.desc      Check the shape of both reference bodies: either a positive decimal media id or the layer
     *               resource name, never a qualified or empty token
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLayeredTargetForm0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const backgroundTarget: string = refTarget(layeredReference(BACKGROUND_NAME));
      const foregroundTarget: string = refTarget(layeredReference(FOREGROUND_NAME));
      const readable: boolean = (isDigits(backgroundTarget) || backgroundTarget === BACKGROUND_NAME) &&
        (isDigits(foregroundTarget) || foregroundTarget === FOREGROUND_NAME);
      logCase('testLayeredTargetForm0001', `background=${backgroundTarget} foreground=${foregroundTarget} ` +
        `readable=${readable}`);
      expect(readable).assertTrue();
      expect(backgroundTarget.indexOf('/') < 0).assertTrue();
      expect(foregroundTarget.indexOf('.') < 0).assertTrue();
      expect(isDigits(backgroundTarget) ? Number(backgroundTarget) > 0 : backgroundTarget === BACKGROUND_NAME)
        .assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_4600
     * @tc.name      testLayeredTargetsFormat0001
     * @tc.desc      Check both resolved layers share the same pixel format and canvas while remaining separate
     *               chunk streams
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLayeredTargetsFormat0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const background: Uint8Array = layerBytes(layeredReference(BACKGROUND_NAME));
      const foreground: Uint8Array = layerBytes(layeredReference(FOREGROUND_NAME));
      const sameDepth: boolean = PngOracle.bitDepth(background) === PngOracle.bitDepth(foreground) &&
        PngOracle.colorType(background) === PngOracle.colorType(foreground);
      logCase('testLayeredTargetsFormat0001', `backgroundChunks=${chunkTypes(background).length} ` +
        `foregroundChunks=${chunkTypes(foreground).length} sameDepth=${sameDepth}`);
      expect(sameDepth).assertTrue();
      expect(PngOracle.bitDepth(background)).assertEqual(BIT_DEPTH_8);
      expect(PngOracle.colorType(foreground)).assertEqual(COLOR_TYPE_RGBA);
      expect(chunkTypes(background).length >= 3).assertTrue();
      expect(chunkTypes(foreground).length >= 3).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_4700
     * @tc.name      testMediaLengthsPositive0001
     * @tc.desc      Read all four media resources and check each payload is non empty and larger than the smallest
     *               structurally possible png or json document
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testMediaLengthsPositive0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const names: string[] = [START_ICON_NAME, BACKGROUND_NAME, FOREGROUND_NAME, LAYERED_NAME];
      const lengths: number[] = names.map((name: string) => mediaBytes(name).length);
      const pngFloor: number = PngOracle.SIGNATURE.length + CHUNK_OVERHEAD + IHDR_DATA_BYTES;
      logCase('testMediaLengthsPositive0001', `names=${names.join(',')} lengths=${lengths.join(',')} ` +
        `pngFloor=${pngFloor}`);
      expect(lengths.every((size: number) => size > 0)).assertTrue();
      expect(lengths[0] > pngFloor).assertTrue();
      expect(lengths[1] > pngFloor).assertTrue();
      expect(lengths[2] > pngFloor).assertTrue();
      expect(lengths[3] >= LAYER_MIN_BYTES).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_4800
     * @tc.name      testStartIconExactLength0001
     * @tc.desc      Pin the start window icon length to the packed file size and check the other three media do not
     *               claim the same length
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStartIconExactLength0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bytes: Uint8Array = mediaBytes(START_ICON_NAME);
      const otherLengths: number[] = [BACKGROUND_NAME, FOREGROUND_NAME]
        .map((name: string) => mediaBytes(name).length);
      logCase('testStartIconExactLength0001', `length=${bytes.length} others=${otherLengths.join(',')} ` +
        `idatBytes=${chunkDataBytes(bytes, IDAT_TYPE)}`);
      expect(bytes.length).assertEqual(START_ICON_BYTES);
      expect(otherLengths.every((size: number) => size !== bytes.length)).assertTrue();
      expect(bytes.length < SIDE_START_ICON * SIDE_START_ICON).assertTrue();
      expect(bytes.length > chunkDataBytes(bytes, IDAT_TYPE)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_4900
     * @tc.name      testLayerPngLengthFloors0001
     * @tc.desc      Check both layer payloads clear their compression floors and stay below the uncompressed bound
     *               of a 512 px rgba canvas plus chunk slack
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testLayerPngLengthFloors0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const background: number = mediaBytes(BACKGROUND_NAME).length;
      const foreground: number = mediaBytes(FOREGROUND_NAME).length;
      const upper: number = SIDE_LAYER * SIDE_LAYER * 4 + PNG_OVERHEAD_SLACK;
      logCase('testLayerPngLengthFloors0001', `background=${background} foreground=${foreground} upper=${upper}`);
      expect(background >= BACKGROUND_MIN_BYTES).assertTrue();
      expect(foreground >= FOREGROUND_MIN_BYTES).assertTrue();
      expect(background < upper).assertTrue();
      expect(foreground < upper).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_5000
     * @tc.name      testPngLengthsDistinct0001
     * @tc.desc      Check the three png payloads have three different lengths inside a sane size window, so no two
     *               media names alias one file
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPngLengthsDistinct0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const lengths: number[] = [START_ICON_NAME, BACKGROUND_NAME, FOREGROUND_NAME]
        .map((name: string) => mediaBytes(name).length);
      const distinct: Set<number> = new Set<number>(lengths);
      const smallest: number = lengths.reduce((left: number, right: number) => left < right ? left : right);
      const largest: number = lengths.reduce((left: number, right: number) => left > right ? left : right);
      logCase('testPngLengthsDistinct0001', `lengths=${lengths.join(',')} distinct=${distinct.size} ` +
        `smallest=${smallest} largest=${largest}`);
      expect(distinct.size).assertEqual(lengths.length);
      expect(smallest >= FOREGROUND_MIN_BYTES).assertTrue();
      expect(largest < SIDE_LAYER * SIDE_LAYER * 4 + PNG_OVERHEAD_SLACK).assertTrue();
      expect(lengths.every((size: number) => size > 0)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_5100
     * @tc.name      testMediaLengthsFreshContext0001
     * @tc.desc      Read the start window icon through three freshly created module contexts and check each context
     *               reports the same payload length
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaLengthsFreshContext0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const first: number = entryContext().resourceManager.getMediaByNameSync(START_ICON_NAME).length;
      const second: number = entryContext().resourceManager.getMediaByNameSync(START_ICON_NAME).length;
      const third: number = entryContext().resourceManager.getMediaByNameSync(START_ICON_NAME).length;
      logCase('testMediaLengthsFreshContext0001', `lengths=${first},${second},${third}`);
      expect(first).assertEqual(second);
      expect(second).assertEqual(third);
      expect(first).assertEqual(START_ICON_BYTES);
      expect(first > PngOracle.SIGNATURE.length).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_5200
     * @tc.name      testMediaEdgeBytes0001
     * @tc.desc      Check the first two and very last byte of every png media plus the closing brace of the layered
     *               description, which pins the document boundaries of all four files
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaEdgeBytes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const pngs: string[] = [START_ICON_NAME, BACKGROUND_NAME, FOREGROUND_NAME];
      const leadingBad: string[] = pngs.filter((name: string) => {
        const bytes: Uint8Array = mediaBytes(name);
        return bytes[0] !== 0x89 || bytes[1] !== 0x50;
      });
      const closingBad: string[] = pngs.filter((name: string) => {
        const bytes: Uint8Array = mediaBytes(name);
        return bytes[bytes.length - 1] !== 0x82;
      });
      const layered: string = mediaText(LAYERED_NAME);
      logCase('testMediaEdgeBytes0001', `leadingBad=${leadingBad.join(',')} closingBad=${closingBad.join(',')} ` +
        `layeredTail=${layered.charAt(layered.length - 1)}`);
      expect(leadingBad.length).assertEqual(0);
      expect(closingBad.length).assertEqual(0);
      expect(layered.charAt(layered.length - 1)).assertEqual(BRACE_CLOSE);
      expect(layered.indexOf(QUOTE) >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_5300
     * @tc.name      testMediaLengthReadOrder0001
     * @tc.desc      Read the icon first, then the three other media, then the icon again and check the payload is
     *               independent of the read order
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaLengthReadOrder0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const before: Uint8Array = mediaBytes(START_ICON_NAME);
      const middle: number[] = [BACKGROUND_NAME, FOREGROUND_NAME, LAYERED_NAME]
        .map((name: string) => mediaBytes(name).length);
      const after: Uint8Array = mediaBytes(START_ICON_NAME);
      logCase('testMediaLengthReadOrder0001', `before=${before.length} after=${after.length} ` +
        `middle=${middle.join(',')}`);
      expect(after.length).assertEqual(before.length);
      expect(sameBytes(before, after)).assertTrue();
      expect(middle.every((size: number) => size > 0)).assertTrue();
      expect(after.length).assertEqual(START_ICON_BYTES);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_5400
     * @tc.name      testMediaLengthHierarchy0001
     * @tc.desc      Compare the four payload sizes: the layered description is the smallest document and the sum of
     *               the three png payloads stays inside a plausible window
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaLengthHierarchy0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const icon: number = mediaBytes(START_ICON_NAME).length;
      const background: number = mediaBytes(BACKGROUND_NAME).length;
      const foreground: number = mediaBytes(FOREGROUND_NAME).length;
      const layered: number = mediaBytes(LAYERED_NAME).length;
      const total: number = icon + background + foreground;
      logCase('testMediaLengthHierarchy0001', `icon=${icon} background=${background} foreground=${foreground} ` +
        `layered=${layered} total=${total}`);
      expect(layered < icon).assertTrue();
      expect(layered < background).assertTrue();
      expect(layered < foreground).assertTrue();
      expect(total > foreground * 2).assertTrue();
      expect(total < SIDE_LAYER * SIDE_LAYER * 8).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_5500
     * @tc.name      testMediaLengthsAfterGarbage0001
     * @tc.desc      Record the four payload lengths, allocate a batch of short lived objects and check the recorded
     *               lengths still match the media afterwards
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testMediaLengthsAfterGarbage0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const names: string[] = [START_ICON_NAME, BACKGROUND_NAME, FOREGROUND_NAME, LAYERED_NAME];
      const before: number[] = names.map((name: string) => mediaBytes(name).length);
      const garbage: number[][] = [];
      for (let index = 0; index < GARBAGE_COUNT; index++) {
        garbage.push([index, index + 1, index + 2]);
      }
      const after: number[] = names.map((name: string) => mediaBytes(name).length);
      logCase('testMediaLengthsAfterGarbage0001', `before=${before.join(',')} after=${after.join(',')} ` +
        `garbage=${garbage.length}`);
      expect(garbage.length).assertEqual(GARBAGE_COUNT);
      expect(after.join(',')).assertEqual(before.join(','));
      expect(after.every((size: number) => size > 0)).assertTrue();
      expect(before[0]).assertEqual(START_ICON_BYTES);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_5600
     * @tc.name      testMediaLengthsByNameAndId0001
     * @tc.desc      For the media resources published by bundle info and by the layered description compare the
     *               length read by name with the length read through the published id
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMediaLengthsByNameAndId0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const ability: bundleManager.AbilityInfo = await entryAbilityInfo();
      const backgroundRef: string = layeredReference(BACKGROUND_NAME);
      const foregroundRef: string = layeredReference(FOREGROUND_NAME);
      const idLengths: number[] = [
        resources().getMediaContentSync(ability.iconId).length,
        layerBytes(backgroundRef).length,
        layerBytes(foregroundRef).length
      ];
      const nameLengths: number[] = [LAYERED_NAME, BACKGROUND_NAME, FOREGROUND_NAME]
        .map((name: string) => mediaBytes(name).length);
      logCase('testMediaLengthsByNameAndId0001', `byId=${idLengths.join(',')} byName=${nameLengths.join(',')} ` +
        `startIcon=${mediaBytes(START_ICON_NAME).length}`);
      expect(idLengths.join(',')).assertEqual(nameLengths.join(','));
      expect(idLengths.every((size: number) => size > 0)).assertTrue();
      expect(mediaBytes(START_ICON_NAME).length).assertEqual(START_ICON_BYTES);
      expect(idLengths[2] >= FOREGROUND_MIN_BYTES).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_5700
     * @tc.name      testRepeatStartIconTwice0001
     * @tc.desc      Read the start window icon twice and check the two payloads, their lengths and their chunk counts
     *               coincide
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepeatStartIconTwice0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const first: Uint8Array = mediaBytes(START_ICON_NAME);
      const second: Uint8Array = mediaBytes(START_ICON_NAME);
      logCase('testRepeatStartIconTwice0001', `first=${first.length} second=${second.length} ` +
        `firstChunks=${chunkTypes(first).length} secondChunks=${chunkTypes(second).length}`);
      expect(sameBytes(first, second)).assertTrue();
      expect(first.length).assertEqual(second.length);
      expect(chunkTypes(first).length).assertEqual(chunkTypes(second).length);
      expect(PngOracle.hasSignature(second)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_5800
     * @tc.name      testRepeatLayeredTextSizes0001
     * @tc.desc      Decode the layered description five times and check the decoded size and member inventory stay
     *               constant across repetitions
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepeatLayeredTextSizes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const sizes: number[] = [];
      const members: number[] = [];
      for (let round = 0; round < 5; round++) {
        const text: string = mediaText(LAYERED_NAME);
        sizes.push(text.length);
        members.push(scanPairs(text).length);
      }
      logCase('testRepeatLayeredTextSizes0001', `sizes=${sizes.join(',')} members=${members.join(',')}`);
      expect(new Set<number>(sizes).size).assertEqual(1);
      expect(new Set<number>(members).size).assertEqual(1);
      expect(sizes[0] >= LAYER_MIN_BYTES && sizes[0] < LAYER_MAX_BYTES).assertTrue();
      expect(members[0]).assertEqual(3);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_5900
     * @tc.name      testRepeatForegroundPrefixes0001
     * @tc.desc      Read the foreground five times and compare only the leading 32 bytes of each copy, checking no
     *               read returns a truncated or shifted header
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepeatForegroundPrefixes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const reference: Uint8Array = prefixBytes(mediaBytes(FOREGROUND_NAME), 32);
      let drift: number = 0;
      let lengthDrift: number = 0;
      for (let round = 0; round < 5; round++) {
        const bytes: Uint8Array = mediaBytes(FOREGROUND_NAME);
        if (!sameBytes(prefixBytes(bytes, 32), reference)) {
          drift = drift + 1;
        }
        if (bytes.length < 32) {
          lengthDrift = lengthDrift + 1;
        }
      }
      logCase('testRepeatForegroundPrefixes0001', `drift=${drift} lengthDrift=${lengthDrift} ` +
        `prefix=${reference.length}`);
      expect(drift).assertEqual(0);
      expect(lengthDrift).assertEqual(0);
      expect(reference.length).assertEqual(32);
      expect(PngOracle.hasSignature(reference)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_6000
     * @tc.name      testRepeatInterleavedLayers0001
     * @tc.desc      Interleave the two layer reads and check the second reading of each layer still matches its own
     *               first reading instead of leaking into the other layer
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepeatInterleavedLayers0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const backgroundFirst: Uint8Array = mediaBytes(BACKGROUND_NAME);
      const foregroundFirst: Uint8Array = mediaBytes(FOREGROUND_NAME);
      const backgroundSecond: Uint8Array = mediaBytes(BACKGROUND_NAME);
      const foregroundSecond: Uint8Array = mediaBytes(FOREGROUND_NAME);
      logCase('testRepeatInterleavedLayers0001', `backgroundStable=${sameBytes(backgroundFirst, backgroundSecond)} ` +
        `foregroundStable=${sameBytes(foregroundFirst, foregroundSecond)}`);
      expect(sameBytes(backgroundFirst, backgroundSecond)).assertTrue();
      expect(sameBytes(foregroundFirst, foregroundSecond)).assertTrue();
      expect(sameBytes(backgroundSecond, foregroundSecond)).assertFalse();
      expect(backgroundSecond.length).assertEqual(backgroundFirst.length);
      expect(foregroundSecond.length).assertEqual(foregroundFirst.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_6100
     * @tc.name      testRepeatIdReadsStable0001
     * @tc.desc      Read the ability icon four times through its published id and check every copy keeps the
     *               description length and the identical payload
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepeatIdReadsStable0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const ability: bundleManager.AbilityInfo = await entryAbilityInfo();
      const copies: Uint8Array[] = [];
      for (let round = 0; round < 4; round++) {
        copies.push(resources().getMediaContentSync(ability.iconId));
      }
      const drifted: number[] = copies
        .filter((copy: Uint8Array) => !sameBytes(copy, copies[0]))
        .map((copy: Uint8Array) => copy.length);
      logCase('testRepeatIdReadsStable0001', `copies=${copies.length} drifted=${drifted.join(',')} ` +
        `first=${copies[0].length}`);
      expect(copies.length).assertEqual(4);
