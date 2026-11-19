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
      expect(drifted.length).assertEqual(0);
      expect(copies[0].length).assertEqual(mediaBytes(LAYERED_NAME).length);
      expect(PngOracle.hasSignature(copies[3])).assertFalse();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_6200
     * @tc.name      testRepeatAfterAllocation0001
     * @tc.desc      Keep a background copy alive, allocate five thousand throwaway strings and check the kept copy
     *               and a fresh background read are still byte identical
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRepeatAfterAllocation0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const kept: Uint8Array = mediaBytes(BACKGROUND_NAME);
      const layeredKept: string = mediaText(LAYERED_NAME);
      const garbage: string[] = [];
      for (let index = 0; index < HEAVY_GARBAGE_COUNT; index++) {
        garbage.push('media-churn-' + index.toString());
      }
      const fresh: Uint8Array = mediaBytes(BACKGROUND_NAME);
      const layeredFresh: string = mediaText(LAYERED_NAME);
      logCase('testRepeatAfterAllocation0001', `garbage=${garbage.length} kept=${kept.length} ` +
        `fresh=${fresh.length} layeredStable=${layeredKept === layeredFresh}`);
      expect(garbage.length).assertEqual(HEAVY_GARBAGE_COUNT);
      expect(sameBytes(kept, fresh)).assertTrue();
      expect(layeredKept === layeredFresh).assertTrue();
      expect(fresh.length >= BACKGROUND_MIN_BYTES).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_6300
     * @tc.name      testRepeatAfterReferenceDrop0001
     * @tc.desc      Drop the local reference to a background payload, then read it again and check the new copy has
     *               the length remembered before the drop
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRepeatAfterReferenceDrop0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      let held: Uint8Array = mediaBytes(BACKGROUND_NAME);
      const remembered: number = held.length;
      const rememberedHead: Uint8Array = prefixBytes(held, 8);
      held = new Uint8Array(0);
      const reread: Uint8Array = mediaBytes(BACKGROUND_NAME);
      logCase('testRepeatAfterReferenceDrop0001', `remembered=${remembered} reread=${reread.length} ` +
        `dropped=${held.length}`);
      expect(held.length).assertEqual(0);
      expect(reread.length).assertEqual(remembered);
      expect(sameBytes(prefixBytes(reread, 8), rememberedHead)).assertTrue();
      expect(PngOracle.hasSignature(reread)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_6400
     * @tc.name      testRepeatThreeRounds0001
     * @tc.desc      Read the three png media in three consecutive rounds and check the round wise length vectors are
     *               equal element by element
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepeatThreeRounds0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const names: string[] = [START_ICON_NAME, BACKGROUND_NAME, FOREGROUND_NAME];
      const rounds: string[] = [];
      for (let round = 0; round < 3; round++) {
        rounds.push(names.map((name: string) => mediaBytes(name).length).join('-'));
      }
      const differing: number = rounds.filter((entry: string) => entry !== rounds[0]).length;
      logCase('testRepeatThreeRounds0001', `rounds=${rounds.join('|')} differing=${differing}`);
      expect(rounds.length).assertEqual(3);
      expect(differing).assertEqual(0);
      expect(rounds[0].split('-').length).assertEqual(names.length);
      expect(rounds[2]).assertEqual(rounds[0]);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_6500
     * @tc.name      testRepeatIconIdThreeReads0001
     * @tc.desc      Read the layered description three times through the ability icon id and check payload, decoded
     *               text and member count agree with the name based read
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testRepeatIconIdThreeReads0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const ability: bundleManager.AbilityInfo = await entryAbilityInfo();
      const texts: string[] = [];
      for (let round = 0; round < 3; round++) {
        const bytes: Uint8Array = resources().getMediaContentSync(ability.iconId);
        texts.push(util.TextDecoder.create('utf-8').decodeToString(bytes));
      }
      const nameText: string = mediaText(LAYERED_NAME);
      const sizes: string = texts.map((text: string) => text.length).join(',');
      logCase('testRepeatIconIdThreeReads0001', `rounds=${texts.length} sizes=${sizes} ` +
        `matchesName=${texts[0] === nameText}`);
      expect(new Set<string>(texts).size).assertEqual(1);
      expect(texts[0] === nameText).assertTrue();
      expect(scanPairs(texts[2]).length).assertEqual(scanPairs(nameText).length);
      expect(texts[1].charAt(0)).assertEqual(BRACE_OPEN);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_6600
     * @tc.name      testRepeatBackgroundDigest0001
     * @tc.desc      Fold the whole background payload into a small byte sum three times and check the digest, the
     *               length and the first byte never change
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testRepeatBackgroundDigest0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const digests: number[] = [];
      const lengths: number[] = [];
      for (let round = 0; round < 3; round++) {
        const bytes: Uint8Array = mediaBytes(BACKGROUND_NAME);
        let fold: number = 0;
        for (let index = 0; index < bytes.length; index++) {
          fold = (fold + bytes[index]) % 65536;
        }
        digests.push(fold);
        lengths.push(bytes.length);
      }
      logCase('testRepeatBackgroundDigest0001', `digests=${digests.join(',')} lengths=${lengths.join(',')}`);
      expect(new Set<number>(digests).size).assertEqual(1);
      expect(new Set<number>(lengths).size).assertEqual(1);
      expect(digests[0] > 0).assertTrue();
      expect(lengths[0] >= BACKGROUND_MIN_BYTES).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_6700
     * @tc.name      testAsyncStartIconParity0001
     * @tc.desc      Resolve the start window icon through the promise api and check the payload equals the
     *               synchronous read including the chunk order
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAsyncStartIconParity0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const asyncBytes: Uint8Array = await resources().getMediaByName(START_ICON_NAME);
      const syncBytes: Uint8Array = mediaBytes(START_ICON_NAME);
      logCase('testAsyncStartIconParity0001', `asyncLength=${asyncBytes.length} ` +
        `syncLength=${syncBytes.length} asyncChunks=${chunkTypes(asyncBytes).length}`);
      expect(sameBytes(asyncBytes, syncBytes)).assertTrue();
      expect(asyncBytes.length).assertEqual(START_ICON_BYTES);
      expect(chunkTypes(asyncBytes).join(',')).assertEqual(chunkTypes(syncBytes).join(','));
      expect(PngOracle.hasSignature(asyncBytes)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_6800
     * @tc.name      testAsyncBackgroundParity0001
     * @tc.desc      Resolve the background layer through the promise api and check header geometry and the leading
     *               bytes match the synchronous read
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAsyncBackgroundParity0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const asyncBytes: Uint8Array = await resources().getMediaByName(BACKGROUND_NAME);
      const syncBytes: Uint8Array = mediaBytes(BACKGROUND_NAME);
      logCase('testAsyncBackgroundParity0001', `asyncWidth=${PngOracle.width(asyncBytes)} ` +
        `syncWidth=${PngOracle.width(syncBytes)} asyncLength=${asyncBytes.length}`);
      expect(asyncBytes.length).assertEqual(syncBytes.length);
      expect(sameBytes(prefixBytes(asyncBytes, 32), prefixBytes(syncBytes, 32))).assertTrue();
      expect(PngOracle.width(asyncBytes)).assertEqual(SIDE_LAYER);
      expect(PngOracle.height(asyncBytes)).assertEqual(SIDE_LAYER);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_6900
     * @tc.name      testAsyncForegroundIdParity0001
     * @tc.desc      Compare the promise read of the foreground with the synchronous read through the layered image
     *               reference and check the pixel format of both
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAsyncForegroundIdParity0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const asyncBytes: Uint8Array = await resources().getMediaByName(FOREGROUND_NAME);
      const byRef: Uint8Array = layerBytes(layeredReference(FOREGROUND_NAME));
      logCase('testAsyncForegroundIdParity0001', `asyncLength=${asyncBytes.length} refLength=${byRef.length} ` +
        `colorType=${PngOracle.colorType(asyncBytes)}`);
      expect(sameBytes(asyncBytes, byRef)).assertTrue();
      expect(asyncBytes.length).assertEqual(byRef.length);
      expect(PngOracle.colorType(asyncBytes)).assertEqual(COLOR_TYPE_RGBA);
      expect(PngOracle.bitDepth(asyncBytes)).assertEqual(BIT_DEPTH_8);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_7000
     * @tc.name      testAsyncLayeredParity0001
     * @tc.desc      Resolve the layered description through the promise api and check the decoded text, its size and
     *               its member count match the synchronous path
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAsyncLayeredParity0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const asyncBytes: Uint8Array = await resources().getMediaByName(LAYERED_NAME);
      const asyncText: string = util.TextDecoder.create('utf-8').decodeToString(asyncBytes);
      const syncText: string = mediaText(LAYERED_NAME);
      logCase('testAsyncLayeredParity0001', `asyncBytes=${asyncBytes.length} asyncText=${asyncText.length} ` +
        `pairs=${scanPairs(asyncText).length}`);
      expect(asyncText === syncText).assertTrue();
      expect(asyncText.length >= LAYER_MIN_BYTES).assertTrue();
      expect(scanPairs(asyncText).length).assertEqual(scanPairs(syncText).length);
      expect(asyncText.charAt(0)).assertEqual(BRACE_OPEN);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_7100
     * @tc.name      testAsyncConcurrentReads0001
     * @tc.desc      Request the three png media concurrently and check each resolved payload matches its own
     *               synchronous read and the packed icon length
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testAsyncConcurrentReads0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const pending: Promise<Uint8Array>[] = [
        resources().getMediaByName(START_ICON_NAME),
        resources().getMediaByName(BACKGROUND_NAME),
        resources().getMediaByName(FOREGROUND_NAME)
      ];
      const resolved: Uint8Array[] = await Promise.all(pending);
      const syncLengths: number[] = [START_ICON_NAME, BACKGROUND_NAME, FOREGROUND_NAME]
        .map((name: string) => mediaBytes(name).length);
      logCase('testAsyncConcurrentReads0001', `resolved=${resolved.length} ` +
        `asyncLengths=${resolved.map((bytes: Uint8Array) => bytes.length).join(',')} ` +
        `syncLengths=${syncLengths.join(',')}`);
      expect(resolved.length).assertEqual(pending.length);
      expect(resolved.map((bytes: Uint8Array) => bytes.length).join(',')).assertEqual(syncLengths.join(','));
      expect(resolved.every((bytes: Uint8Array) => PngOracle.hasSignature(bytes))).assertTrue();
      expect(resolved[0].length).assertEqual(START_ICON_BYTES);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_7200
     * @tc.name      testAsyncUnknownNameRejected0001
     * @tc.desc      Ask the promise api for a media name that carries a file suffix and check the rejection code
     *               equals the one of the synchronous api while the plain name still resolves
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAsyncUnknownNameRejected0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const asyncCode: number = await asyncMediaErrorCode('startIcon.png');
      const syncCode: number = errorCode(() => mediaBytes('startIcon.png'));
      const controlCode: number = await asyncMediaErrorCode(START_ICON_NAME);
      logCase('testAsyncUnknownNameRejected0001', `asyncCode=${asyncCode} syncCode=${syncCode} ` +
        `controlCode=${controlCode} expected=${ERR_RES_NAME_INVALID}`);
      expect(asyncCode).assertEqual(ERR_RES_NAME_INVALID);
      expect(syncCode).assertEqual(asyncCode);
      expect(controlCode).assertEqual(NO_ERROR);
      expect(asyncCode !== ERR_RES_ID_INVALID).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_7300
     * @tc.name      testNameWithPngSuffix0001
     * @tc.desc      Ask for a media resource with the physical file name including the png suffix and check the name
     *               is rejected while the resource name resolves
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNameWithPngSuffix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const suffixed: number = errorCode(() => mediaBytes(BACKGROUND_NAME + '.png'));
      const plain: number = errorCode(() => mediaBytes(BACKGROUND_NAME));
      const headless: number = errorCode(() => mediaBytes('.png'));
      logCase('testNameWithPngSuffix0001', `suffixed=${suffixed} plain=${plain} headless=${headless}`);
      expect(suffixed).assertEqual(ERR_RES_NAME_INVALID);
      expect(plain).assertEqual(NO_ERROR);
      expect(headless).assertEqual(ERR_RES_NAME_INVALID);
      expect(suffixed !== plain).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_7400
     * @tc.name      testNameCaseSensitivity0001
     * @tc.desc      Check media name lookup is case sensitive: upper cased variants are rejected while the lower
     *               camel and lower flat spellings resolve
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNameCaseSensitivity0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const upperCamel: number = errorCode(() => mediaBytes('StartIcon'));
      const upperFlat: number = errorCode(() => mediaBytes('BACKGROUND'));
      const lowerCamel: number = errorCode(() => mediaBytes(START_ICON_NAME));
      const lowerFlat: number = errorCode(() => mediaBytes(BACKGROUND_NAME));
      logCase('testNameCaseSensitivity0001', `upperCamel=${upperCamel} upperFlat=${upperFlat} ` +
        `lowerCamel=${lowerCamel} lowerFlat=${lowerFlat}`);
      expect(upperCamel).assertEqual(ERR_RES_NAME_INVALID);
      expect(upperFlat).assertEqual(ERR_RES_NAME_INVALID);
      expect(lowerCamel).assertEqual(NO_ERROR);
      expect(lowerFlat).assertEqual(NO_ERROR);
      expect(upperCamel === upperFlat).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_7500
     * @tc.name      testNameTrailingSpace0001
     * @tc.desc      Check that surrounding whitespace is not trimmed by the media lookup: both a trailing and a
     *               leading space are rejected
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNameTrailingSpace0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const trailing: number = errorCode(() => mediaBytes(FOREGROUND_NAME + SPACE));
      const leading: number = errorCode(() => mediaBytes(SPACE + FOREGROUND_NAME));
      const inner: number = errorCode(() => mediaBytes('fore ground'));
      const exact: number = errorCode(() => mediaBytes(FOREGROUND_NAME));
      logCase('testNameTrailingSpace0001', `trailing=${trailing} leading=${leading} inner=${inner} ` +
        `exact=${exact}`);
      expect(trailing).assertEqual(ERR_RES_NAME_INVALID);
      expect(leading).assertEqual(ERR_RES_NAME_INVALID);
      expect(inner).assertEqual(ERR_RES_NAME_INVALID);
      expect(exact).assertEqual(NO_ERROR);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_7600
     * @tc.name      testNameHyphenated0001
     * @tc.desc      Swap the underscore of the layered description name for the hyphen used inside its content and
     *               check only the underscore spelling is a resource
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNameHyphenated0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const hyphenName: string = 'layered' + '-' + 'image';
      const hyphenMedia: number = errorCode(() => mediaBytes(hyphenName));
      const hyphenString: number = errorCode(() => resources().getStringByNameSync(hyphenName));
      const underscore: number = errorCode(() => mediaBytes(LAYERED_NAME));
      logCase('testNameHyphenated0001', `hyphenName=${hyphenName} hyphenMedia=${hyphenMedia} ` +
        `hyphenString=${hyphenString} underscore=${underscore}`);
      expect(hyphenMedia).assertEqual(ERR_RES_NAME_INVALID);
      expect(hyphenString).assertEqual(ERR_RES_NAME_INVALID);
      expect(underscore).assertEqual(NO_ERROR);
      expect(mediaText(LAYERED_NAME).indexOf(LAYER_KEY) >= 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_7700
     * @tc.name      testNameWithJsonSuffix0001
     * @tc.desc      Ask for the layered description and for the pages profile with their json suffix and check the
     *               media lookup rejects the suffixed forms
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNameWithJsonSuffix0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const layeredSuffixed: number = errorCode(() => mediaBytes(LAYERED_NAME + '.json'));
      const pagesAsMedia: number = errorCode(() => mediaBytes('main_pages'));
      const layeredPlain: number = errorCode(() => mediaBytes(LAYERED_NAME));
      logCase('testNameWithJsonSuffix0001', `layeredSuffixed=${layeredSuffixed} pagesAsMedia=${pagesAsMedia} ` +
        `layeredPlain=${layeredPlain}`);
      expect(layeredSuffixed).assertEqual(ERR_RES_NAME_INVALID);
      expect(pagesAsMedia).assertEqual(ERR_RES_NAME_INVALID);
      expect(layeredPlain).assertEqual(NO_ERROR);
      expect(layeredSuffixed === pagesAsMedia).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_7800
     * @tc.name      testNameDottedForm0001
     * @tc.desc      Check the qualified and already prefixed spellings of a media name are not accepted: neither the
     *               module qualified form nor the raw media reference resolves through the per name api
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNameDottedForm0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const dotted: number = errorCode(() => mediaBytes('media.' + START_ICON_NAME));
      const moduleScoped: number = errorCode(() => mediaBytes(ENTRY_MODULE + '.media.' + START_ICON_NAME));
      const prefixed: number = errorCode(() => mediaBytes(MEDIA_PREFIX + START_ICON_NAME));
      const plain: number = errorCode(() => mediaBytes(START_ICON_NAME));
      logCase('testNameDottedForm0001', `dotted=${dotted} moduleScoped=${moduleScoped} prefixed=${prefixed} ` +
        `plain=${plain}`);
      expect(dotted).assertEqual(ERR_RES_NAME_INVALID);
      expect(moduleScoped).assertEqual(ERR_RES_NAME_INVALID);
      expect(prefixed).assertEqual(ERR_RES_NAME_INVALID);
      expect(plain).assertEqual(NO_ERROR);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_7900
     * @tc.name      testNameEmptyAndBlank0001
     * @tc.desc      Ask for media with the empty name and with a single space and check both are rejected with the
     *               same name error a valid lookup avoids
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNameEmptyAndBlank0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const empty: number = errorCode(() => mediaBytes(EMPTY_TEXT));
      const blank: number = errorCode(() => mediaBytes(SPACE));
      const blankCount: number = errorCode(() => mediaBytes(SPACE + SPACE + SPACE));
      const valid: number = errorCode(() => mediaBytes(LAYERED_NAME));
      logCase('testNameEmptyAndBlank0001', `empty=${empty} blank=${blank} blankCount=${blankCount} ` +
        `valid=${valid}`);
      expect(empty).assertEqual(ERR_RES_NAME_INVALID);
      expect(blank).assertEqual(ERR_RES_NAME_INVALID);
      expect(blankCount).assertEqual(ERR_RES_NAME_INVALID);
      expect(valid).assertEqual(NO_ERROR);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_8000
     * @tc.name      testStringResourceAsMedia0001
     * @tc.desc      Ask for two string resources through the media api and check the type mismatch is reported while
     *               the same names still read as strings
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testStringResourceAsMedia0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const labelAsMedia: number = errorCode(() => mediaBytes('app_name'));
      const descAsMedia: number = errorCode(() => mediaBytes('module_desc'));
      const labelText: string = resources().getStringByNameSync('app_name');
      logCase('testStringResourceAsMedia0001', `labelAsMedia=${labelAsMedia} descAsMedia=${descAsMedia} ` +
        `labelLength=${labelText.length}`);
      expect(labelAsMedia).assertEqual(ERR_RES_NAME_INVALID);
      expect(descAsMedia).assertEqual(ERR_RES_NAME_INVALID);
      expect(labelText.length > 0).assertTrue();
      expect(labelAsMedia === descAsMedia).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_8100
     * @tc.name      testColorResourceAsMedia0001
     * @tc.desc      Cross the media and color resource spaces: the start window background colour is not a media
     *               resource and the start window icon is not a colour
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testColorResourceAsMedia0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const colorAsMedia: number = errorCode(() => mediaBytes('start_window_background'));
      const iconAsColor: number = errorCode(() => resources().getColorByNameSync(START_ICON_NAME));
      const color: number = resources().getColorByNameSync('start_window_background');
      logCase('testColorResourceAsMedia0001', `colorAsMedia=${colorAsMedia} iconAsColor=${iconAsColor} ` +
        `color=${color}`);
      expect(colorAsMedia).assertEqual(ERR_RES_NAME_INVALID);
      expect(iconAsColor).assertEqual(ERR_RES_NAME_INVALID);
      expect(color >>> 24).assertEqual(0xFF);
      expect(colorAsMedia === iconAsColor).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_8200
     * @tc.name      testNamePaddedLength0001
     * @tc.desc      Ask for media with a five hundred and twelve character name and with that padding glued in front
     *               of a real name, checking both padded spellings are rejected
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNamePaddedLength0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const padded: number = errorCode(() => mediaBytes(LONG_NAME));
      const glued: number = errorCode(() => mediaBytes(LONG_NAME + START_ICON_NAME));
      const realLength: number = START_ICON_NAME.length;
      logCase('testNamePaddedLength0001', `padded=${padded} glued=${glued} paddedLength=${LONG_NAME.length} ` +
        `realLength=${realLength}`);
      expect(padded).assertEqual(ERR_RES_NAME_INVALID);
      expect(glued).assertEqual(ERR_RES_NAME_INVALID);
      expect(LONG_NAME.length > realLength * 10).assertTrue();
      expect(errorCode(() => mediaBytes(START_ICON_NAME))).assertEqual(NO_ERROR);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_8300
     * @tc.name      testNameNonAsciiRejected0001
     * @tc.desc      Ask for media and for a string with a resource name built from two non ascii code points and
     *               check the lookup reports the name error instead of crashing
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNameNonAsciiRejected0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const mediaCode: number = errorCode(() => mediaBytes(CJK_NAME));
      const stringCode: number = errorCode(() => resources().getStringByNameSync(CJK_NAME));
      const codes: number[] = [CJK_NAME.charCodeAt(0), CJK_NAME.charCodeAt(1)];
      logCase('testNameNonAsciiRejected0001', `mediaCode=${mediaCode} stringCode=${stringCode} ` +
        `codes=${codes.join(',')}`);
      expect(mediaCode).assertEqual(ERR_RES_NAME_INVALID);
      expect(stringCode).assertEqual(ERR_RES_NAME_INVALID);
      expect(codes.every((code: number) => code > 0x7F)).assertTrue();
      expect(mediaCode === stringCode).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_8400
     * @tc.name      testNameUpperCaseLayered0001
     * @tc.desc      Check the layered description name is not reachable through upper cased or mixed cased
     *               spellings and that the lowercase name is rejected by the string api
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNameUpperCaseLayered0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const upper: number = errorCode(() => mediaBytes('LAYERED_IMAGE'));
      const mixed: number = errorCode(() => mediaBytes('layered_Image'));
      const asString: number = errorCode(() => resources().getStringByNameSync(LAYERED_NAME));
      logCase('testNameUpperCaseLayered0001', `upper=${upper} mixed=${mixed} asString=${asString}`);
      expect(upper).assertEqual(ERR_RES_NAME_INVALID);
      expect(mixed).assertEqual(ERR_RES_NAME_INVALID);
      expect(asString).assertEqual(ERR_RES_NAME_INVALID);
      expect(errorCode(() => mediaBytes(LAYERED_NAME))).assertEqual(NO_ERROR);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_8500
     * @tc.name      testIdZeroRejected0001
     * @tc.desc      Ask for media content with id zero and check the id error is reported, then confirm a published
     *               id still returns bytes
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIdZeroRejected0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const ability: bundleManager.AbilityInfo = await entryAbilityInfo();
      const zero: number = errorCode(() => resources().getMediaContentSync(BAD_ID_ZERO));
      const twice: number = errorCode(() => resources().getMediaContentSync(BAD_ID_ZERO));
      const valid: number = errorCode(() => resources().getMediaContentSync(ability.iconId));
      logCase('testIdZeroRejected0001', `zero=${zero} twice=${twice} valid=${valid} ` +
        `iconId=${ability.iconId}`);
      expect(zero).assertEqual(ERR_RES_ID_INVALID);
      expect(twice).assertEqual(zero);
      expect(valid).assertEqual(NO_ERROR);
      expect(zero !== valid).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_8600
     * @tc.name      testIdOneRejected0001
     * @tc.desc      Ask for media content with id one and check the exact error code, its stability and the
     *               distinction from the name error code
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIdOneRejected0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const one: number = errorCode(() => resources().getMediaContentSync(BAD_ID_ONE));
      const again: number = errorCode(() => resources().getMediaContentSync(BAD_ID_ONE));
      logCase('testIdOneRejected0001', `one=${one} again=${again} expected=${ERR_RES_ID_INVALID}`);
      expect(one).assertEqual(ERR_RES_ID_INVALID);
      expect(again).assertEqual(one);
      expect(one !== ERR_RES_NAME_INVALID).assertTrue();
      expect(one < ERR_RES_NAME_INVALID).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_8700
     * @tc.name      testIdMaxMediaRejected0001
     * @tc.desc      Ask for media content with the largest value the media id space can hold and check the id error
     *               is reported instead of an empty payload
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIdMaxMediaRejected0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const maxId: number = errorCode(() => resources().getMediaContentSync(BAD_ID_MEDIA_MAX));
      const nearMax: number = errorCode(() => resources().getMediaContentSync(BAD_ID_MEDIA_MAX - 1));
      const nameFailure: number = errorCode(() => mediaBytes(BACKGROUND_NAME + '.png'));
      logCase('testIdMaxMediaRejected0001', `maxId=${maxId} nearMax=${nearMax} nameFailure=${nameFailure} ` +
        `value=${BAD_ID_MEDIA_MAX}`);
      expect(maxId).assertEqual(ERR_RES_ID_INVALID);
      expect(nearMax).assertEqual(ERR_RES_ID_INVALID);
      expect(nameFailure).assertEqual(ERR_RES_NAME_INVALID);
      expect(maxId !== nameFailure).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_8800
     * @tc.name      testIdIntMaxRejected0001
     * @tc.desc      Ask for media content with the largest positive 32 bit value and with its predecessor, checking
     *               both overflow free rejections carry the id error
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIdIntMaxRejected0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const intMax: number = errorCode(() => resources().getMediaContentSync(BAD_ID_INT_MAX));
      const belowIntMax: number = errorCode(() => resources().getMediaContentSync(BAD_ID_INT_MAX - 1));
      logCase('testIdIntMaxRejected0001', `intMax=${intMax} belowIntMax=${belowIntMax} value=${BAD_ID_INT_MAX}`);
      expect(intMax).assertEqual(ERR_RES_ID_INVALID);
      expect(belowIntMax).assertEqual(ERR_RES_ID_INVALID);
      expect(intMax === belowIntMax).assertTrue();
      expect(BAD_ID_INT_MAX > BAD_ID_MEDIA_MAX).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_8900
     * @tc.name      testIdLargeRejected0001
     * @tc.desc      Ask for media content with a nine digit id and with twice that id and check both are rejected
     *               with the id error while the published icon id still resolves
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIdLargeRejected0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const ability: bundleManager.AbilityInfo = await entryAbilityInfo();
      const large: number = errorCode(() => resources().getMediaContentSync(BAD_ID_LARGE));
      const doubled: number = errorCode(() => resources().getMediaContentSync(BAD_ID_LARGE * 2));
      const valid: number = errorCode(() => resources().getMediaContentSync(ability.iconId));
      logCase('testIdLargeRejected0001', `large=${large} doubled=${doubled} valid=${valid} ` +
        `value=${BAD_ID_LARGE}`);
      expect(large).assertEqual(ERR_RES_ID_INVALID);
      expect(doubled).assertEqual(ERR_RES_ID_INVALID);
      expect(valid).assertEqual(NO_ERROR);
      expect(large === doubled).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_9000
     * @tc.name      testIdArbitraryRejected0001
     * @tc.desc      Probe three ids around an arbitrary six digit value and check every probe reports the id error
     *               exactly once
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIdArbitraryRejected0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const probes: number[] = [BAD_ID_ARBITRARY - 100, BAD_ID_ARBITRARY, BAD_ID_ARBITRARY + 100];
      const codes: number[] = probes.map((id: number) => errorCode(() => resources().getMediaContentSync(id)));
      const rejected: number = codes.filter((code: number) => code === ERR_RES_ID_INVALID).length;
      logCase('testIdArbitraryRejected0001', `probes=${probes.join(',')} codes=${codes.join(',')} ` +
        `rejected=${rejected}`);
      expect(codes.length).assertEqual(probes.length);
      expect(rejected).assertEqual(probes.length);
      expect(new Set<number>(codes).size).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_9100
     * @tc.name      testIdBatchCodes0001
     * @tc.desc      Feed five unusable ids to the media content api in one batch and check the code vector equals the
     *               id error vector
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIdBatchCodes0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const ids: number[] = [BAD_ID_ZERO, BAD_ID_ONE, BAD_ID_ARBITRARY, BAD_ID_LARGE, BAD_ID_INT_MAX];
      const codes: number[] = ids.map((id: number) => errorCode(() => resources().getMediaContentSync(id)));
      const expected: number[] = ids.map(() => ERR_RES_ID_INVALID);
      logCase('testIdBatchCodes0001', `ids=${ids.join(',')} codes=${codes.join(',')}`);
      expect(codes.join(',')).assertEqual(expected.join(','));
      expect(codes.length).assertEqual(ids.length);
      expect(codes.every((code: number) => code !== NO_ERROR)).assertTrue();
      expect(ids.every((id: number) => id >= BAD_ID_ZERO)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_9200
     * @tc.name      testIdValidInvalidValid0001
     * @tc.desc      Read a valid icon id, then a broken id, then the valid id again and check the failure neither
     *               clears nor shortens the following valid payload
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testIdValidInvalidValid0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const ability: bundleManager.AbilityInfo = await entryAbilityInfo();
      const before: Uint8Array = resources().getMediaContentSync(ability.iconId);
      const broken: number = errorCode(() => resources().getMediaContentSync(BAD_ID_MEDIA_MAX));
      const after: Uint8Array = resources().getMediaContentSync(ability.iconId);
      logCase('testIdValidInvalidValid0001', `before=${before.length} broken=${broken} after=${after.length}`);
      expect(broken).assertEqual(ERR_RES_ID_INVALID);
      expect(after.length).assertEqual(before.length);
      expect(sameBytes(before, after)).assertTrue();
      expect(after.length).assertEqual(mediaBytes(LAYERED_NAME).length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_9300
     * @tc.name      testLabelIdAsMedia0001
     * @tc.desc      Use the string id of the ability label as a media id and check the media api rejects it while the
     *               string api resolves the same id
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testLabelIdAsMedia0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const ability: bundleManager.AbilityInfo = await entryAbilityInfo();
      const asMedia: number = errorCode(() => resources().getMediaContentSync(ability.labelId));
      const asString: string = resources().getStringSync(ability.labelId);
      const invalid: number = errorCode(() => resources().getMediaContentSync(BAD_ID_ARBITRARY));
      logCase('testLabelIdAsMedia0001', `labelId=${ability.labelId} asMedia=${asMedia} ` +
        `labelLength=${asString.length} invalid=${invalid}`);
      expect(asMedia !== NO_ERROR).assertTrue();
      expect(asString.length > 0).assertTrue();
      expect(ability.labelId !== ability.iconId).assertTrue();
      expect(invalid).assertEqual(ERR_RES_ID_INVALID);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_9400
     * @tc.name      testNameAndIdErrorSplit0001
     * @tc.desc      Check the two lookup failures use two different codes: an unknown name reports the name error and
     *               an unknown id reports the id error, neither ever collides with success
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testNameAndIdErrorSplit0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const nameFailure: number = errorCode(() => mediaBytes('missing_media_icon'));
      const idFailure: number = errorCode(() => resources().getMediaContentSync(BAD_ID_ARBITRARY));
      const success: number = errorCode(() => mediaBytes(FOREGROUND_NAME));
      logCase('testNameAndIdErrorSplit0001', `nameFailure=${nameFailure} idFailure=${idFailure} ` +
        `success=${success}`);
      expect(nameFailure).assertEqual(ERR_RES_NAME_INVALID);
      expect(idFailure).assertEqual(ERR_RES_ID_INVALID);
      expect(nameFailure === idFailure).assertFalse();
      expect(success).assertEqual(NO_ERROR);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_9500
     * @tc.name      testStartIconIndependentWidth0001
     * @tc.desc      Decode the start window icon width with the multiplication based decoder and check the low order
     *               header bytes a 144 px canvas must carry
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testStartIconIndependentWidth0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bytes: Uint8Array = mediaBytes(START_ICON_NAME);
      const headerLength: number = bigEndian32(bytes, PngOracle.SIGNATURE.length);
      const side: number = bigEndian32(bytes, 16);
      const crcField: number = bigEndian32(bytes, PngOracle.SIGNATURE.length + 8 + IHDR_DATA_BYTES);
      const header: PngChunk | undefined = firstChunk(bytes);
      logCase('testStartIconIndependentWidth0001', `headerLength=${headerLength} side=${side} ` +
        `crcField=${crcField} stored=${header === undefined ? -1 : chunkStoredCrc(bytes, header)}`);
      expect(headerLength).assertEqual(IHDR_DATA_BYTES);
      expect(side).assertEqual(SIDE_START_ICON);
      expect(crcField).assertEqual(header === undefined ? -1 : chunkStoredCrc(bytes, header));
      expect(side).assertEqual(bigEndian32(bytes, 20));
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_9600
     * @tc.name      testPngHeaderCrcSweep0001
     * @tc.desc      Recompute the header crc of all three png media and check none is corrupt while the icon header
     *               crc differs from the layer header crc because the canvases differ
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPngHeaderCrcSweep0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const names: string[] = [START_ICON_NAME, BACKGROUND_NAME, FOREGROUND_NAME];
      const stored: number[] = names.map((name: string) => {
        const bytes: Uint8Array = mediaBytes(name);
        const header: PngChunk | undefined = firstChunk(bytes);
        return header === undefined ? -1 : chunkStoredCrc(bytes, header);
      });
      const corrupt: number = names.filter((name: string) => {
        const bytes: Uint8Array = mediaBytes(name);
        const header: PngChunk | undefined = firstChunk(bytes);
        return header === undefined || chunkStoredCrc(bytes, header) !== chunkComputedCrc(bytes, header);
      }).length;
      logCase('testPngHeaderCrcSweep0001', `stored=${stored.join(',')} corrupt=${corrupt}`);
      expect(corrupt).assertEqual(0);
      expect(new Set<number>(stored).size > 1).assertTrue();
      expect(stored.every((value: number) => value > 0)).assertTrue();
      expect(stored[0] !== stored[1]).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_9700
     * @tc.name      testPngHeaderUniformity0001
     * @tc.desc      Check all three png media agree on the header layout: thirteen payload bytes, zero compression,
     *               zero filter and zero interlace markers
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPngHeaderUniformity0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const names: string[] = [START_ICON_NAME, BACKGROUND_NAME, FOREGROUND_NAME];
      const payloads: number[] = names.map((name: string) => {
        const bytes: Uint8Array = mediaBytes(name);
        return PngOracle.readUint32(bytes, PngOracle.SIGNATURE.length);
      });
      const oddFlags: number = names.filter((name: string) => {
        const bytes: Uint8Array = mediaBytes(name);
        return bytes[26] !== 0 || bytes[27] !== 0 || bytes[28] !== 0;
      }).length;
      logCase('testPngHeaderUniformity0001', `payloads=${payloads.join(',')} oddFlags=${oddFlags}`);
      expect(payloads.every((value: number) => value === IHDR_DATA_BYTES)).assertTrue();
      expect(oddFlags).assertEqual(0);
      expect(new Set<number>(payloads).size).assertEqual(1);
      expect(payloads.length).assertEqual(names.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_9800
     * @tc.name      testPngSignatureSweep0001
     * @tc.desc      Compare the eight leading bytes of every png media against the signature table entry by entry and
     *               check no byte deviates
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPngSignatureSweep0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const names: string[] = [START_ICON_NAME, BACKGROUND_NAME, FOREGROUND_NAME];
      let deviations: number = 0;
      let compared: number = 0;
      for (const name of names) {
        const bytes: Uint8Array = mediaBytes(name);
        for (let index = 0; index < PngOracle.SIGNATURE.length; index++) {
          compared = compared + 1;
          if (bytes[index] !== PngOracle.SIGNATURE[index]) {
            deviations = deviations + 1;
          }
        }
      }
      logCase('testPngSignatureSweep0001', `compared=${compared} deviations=${deviations}`);
      expect(compared).assertEqual(names.length * PngOracle.SIGNATURE.length);
      expect(deviations).assertEqual(0);
      expect(PngOracle.SIGNATURE.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_9900
     * @tc.name      testPngGeometryRelations0001
     * @tc.desc      Check the layered canvas is much larger than the start window canvas: its area exceeds ten times
     *               the icon area and its side is larger as well
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPngGeometryRelations0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const icon: Uint8Array = mediaBytes(START_ICON_NAME);
      const layer: Uint8Array = mediaBytes(BACKGROUND_NAME);
      const iconArea: number = PngOracle.width(icon) * PngOracle.height(icon);
      const layerArea: number = PngOracle.width(layer) * PngOracle.height(layer);
      logCase('testPngGeometryRelations0001', `iconSide=${PngOracle.width(icon)} ` +
        `layerSide=${PngOracle.width(layer)} iconArea=${iconArea} layerArea=${layerArea}`);
      expect(PngOracle.width(layer) > PngOracle.width(icon)).assertTrue();
      expect(layerArea > iconArea * 10).assertTrue();
      expect(iconArea).assertEqual(SIDE_START_ICON * SIDE_START_ICON);
      expect(layerArea).assertEqual(SIDE_LAYER * SIDE_LAYER);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_10000
     * @tc.name      testPngBoundaryChunks0001
     * @tc.desc      Check every png media opens with IHDR and closes with IEND and that the opening header always
     *               carries thirteen payload bytes
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testPngBoundaryChunks0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const names: string[] = [START_ICON_NAME, BACKGROUND_NAME, FOREGROUND_NAME];
      const boundaries: string[] = names.map((name: string) => {
        const types: string[] = chunkTypes(mediaBytes(name));
        return types.length === 0 ? 'empty' : types[0] + '-' + types[types.length - 1];
      });
      const headerSizes: number[] = names.map((name: string) => {
        const header: PngChunk | undefined = firstChunk(mediaBytes(name));
        return header === undefined ? -1 : header.dataLength;
      });
      logCase('testPngBoundaryChunks0001', `boundaries=${boundaries.join(',')} headerSizes=${headerSizes.join(',')}`);
      expect(boundaries.every((pair: string) => pair === IHDR_TYPE + '-' + IEND_TYPE)).assertTrue();
      expect(headerSizes.every((size: number) => size === IHDR_DATA_BYTES)).assertTrue();
      expect(boundaries.length).assertEqual(names.length);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_10100
     * @tc.name      testPngFormatUniformity0001
     * @tc.desc      Check the three png media share one pixel format, one bit depth and exactly one header chunk
     *               each, so a renderer can treat them alike
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPngFormatUniformity0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const names: string[] = [START_ICON_NAME, BACKGROUND_NAME, FOREGROUND_NAME];
      const depths: number[] = names.map((name: string) => PngOracle.bitDepth(mediaBytes(name)));
      const types: number[] = names.map((name: string) => PngOracle.colorType(mediaBytes(name)));
      const headerCounts: number[] = names.map((name: string) => chunkTypeCount(mediaBytes(name), IHDR_TYPE));
      logCase('testPngFormatUniformity0001', `depths=${depths.join(',')} types=${types.join(',')} ` +
        `headerCounts=${headerCounts.join(',')}`);
      expect(new Set<number>(depths).size).assertEqual(1);
      expect(new Set<number>(types).size).assertEqual(1);
      expect(depths[0]).assertEqual(BIT_DEPTH_8);
      expect(types[2]).assertEqual(COLOR_TYPE_RGBA);
      expect(headerCounts.every((count: number) => count === 1)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_10200
     * @tc.name      testPngRawSizeBound0001
     * @tc.desc      Check no png media exceeds the uncompressed rgba bound of its own canvas and each payload clears
     *               a one kilobyte floor
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testPngRawSizeBound0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const names: string[] = [START_ICON_NAME, BACKGROUND_NAME, FOREGROUND_NAME];
      const overBound: number = names.filter((name: string) => {
        const bytes: Uint8Array = mediaBytes(name);
        return bytes.length >= PngOracle.width(bytes) * PngOracle.height(bytes) * 4 + PNG_OVERHEAD_SLACK;
      }).length;
      const lengths: number[] = names.map((name: string) => mediaBytes(name).length);
      logCase('testPngRawSizeBound0001', `lengths=${lengths.join(',')} overBound=${overBound}`);
      expect(overBound).assertEqual(0);
      expect(lengths.every((size: number) => size > FOREGROUND_MIN_BYTES)).assertTrue();
      expect(lengths.every((size: number) => size > PNG_OVERHEAD_SLACK)).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_10300
     * @tc.name      testFileSizeStartIcon0001
     * @tc.desc      Write the start window icon into the cache directory and check the file size reported by fileIo
     *               equals the in memory byte count and the head still carries the signature
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileSizeStartIcon0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bytes: Uint8Array = mediaBytes(START_ICON_NAME);
      const written: TempWrite = writeTempMedia(TEMP_START_ICON, bytes);
      try {
        const head: Uint8Array = readTempHead(written.path, PngOracle.SIGNATURE.length);
        logCase('testFileSizeStartIcon0001', `memory=${bytes.length} file=${written.size} headLength=${head.length}`);
        expect(written.size).assertEqual(bytes.length);
        expect(written.size).assertEqual(START_ICON_BYTES);
        expect(sameBytes(head, prefixBytes(bytes, PngOracle.SIGNATURE.length))).assertTrue();
        expect(fileIo.accessSync(written.path)).assertTrue();
      } finally {
        removeTemp(written.path);
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_10400
     * @tc.name      testFileSizeBackground0001
     * @tc.desc      Write the background layer to disk and check the on disk size matches the resource length and the
     *               first thirty two bytes survive the round trip
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileSizeBackground0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bytes: Uint8Array = mediaBytes(BACKGROUND_NAME);
      const written: TempWrite = writeTempMedia(TEMP_BACKGROUND, bytes);
      try {
        const head: Uint8Array = readTempHead(written.path, 32);
        logCase('testFileSizeBackground0001', `memory=${bytes.length} file=${written.size} head=${head.length}`);
        expect(written.size).assertEqual(bytes.length);
        expect(sameBytes(head, prefixBytes(bytes, 32))).assertTrue();
        expect(bytes.length > head.length).assertTrue();
        expect(written.size >= BACKGROUND_MIN_BYTES).assertTrue();
      } finally {
        removeTemp(written.path);
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_10500
     * @tc.name      testFileSizeForeground0001
     * @tc.desc      Write the foreground layer to disk and check the file size and the twenty five header bytes that
     *               carry signature and IHDR
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileSizeForeground0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bytes: Uint8Array = mediaBytes(FOREGROUND_NAME);
      const headerBytes: number = PngOracle.SIGNATURE.length + CHUNK_OVERHEAD + IHDR_DATA_BYTES;
      const written: TempWrite = writeTempMedia(TEMP_FOREGROUND, bytes);
      try {
        const head: Uint8Array = readTempHead(written.path, headerBytes);
        logCase('testFileSizeForeground0001', `memory=${bytes.length} file=${written.size} ` +
          `headerBytes=${headerBytes}`);
        expect(written.size).assertEqual(bytes.length);
        expect(head.length).assertEqual(headerBytes);
        expect(sameBytes(head, prefixBytes(bytes, headerBytes))).assertTrue();
        expect(PngOracle.hasSignature(head)).assertTrue();
      } finally {
        removeTemp(written.path);
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_10600
     * @tc.name      testFileSizeLayeredJson0001
     * @tc.desc      Write the layered description to disk and check the on disk size equals the resource length while
     *               the read back text still carries the wrapper key and no png signature
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testFileSizeLayeredJson0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const bytes: Uint8Array = mediaBytes(LAYERED_NAME);
      const written: TempWrite = writeTempMedia(TEMP_LAYERED, bytes);
      try {
        const copy: Uint8Array = readTempHead(written.path, bytes.length);
        const text: string = util.TextDecoder.create('utf-8').decodeToString(copy);
        logCase('testFileSizeLayeredJson0001', `memory=${bytes.length} file=${written.size} ` +
          `text=${text.length}`);
        expect(written.size).assertEqual(bytes.length);
        expect(text.length).assertEqual(mediaText(LAYERED_NAME).length);
        expect(text.indexOf(LAYER_KEY) >= 0).assertTrue();
        expect(PngOracle.hasSignature(copy)).assertFalse();
      } finally {
        removeTemp(written.path);
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_10700
     * @tc.name      testFileSizeSequentialWrites0001
     * @tc.desc      Overwrite one cache file with the three png payloads in turn and check each reported size matches
     *               the payload just written, so truncation never leaks the previous length
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileSizeSequentialWrites0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const names: string[] = [START_ICON_NAME, BACKGROUND_NAME, FOREGROUND_NAME];
      const expected: number[] = names.map((name: string) => mediaBytes(name).length);
      const observed: number[] = [];
      const first: TempWrite = writeTempMedia(TEMP_SEQUENCE, mediaBytes(names[0]));
      try {
        observed.push(first.size);
        observed.push(writeTempMedia(TEMP_SEQUENCE, mediaBytes(names[1])).size);
        observed.push(writeTempMedia(TEMP_SEQUENCE, mediaBytes(names[2])).size);
        logCase('testFileSizeSequentialWrites0001', `expected=${expected.join(',')} observed=${observed.join(',')}`);
        expect(observed.join(',')).assertEqual(expected.join(','));
        expect(new Set<number>(observed).size).assertEqual(names.length);
        expect(observed[0]).assertEqual(START_ICON_BYTES);
      } finally {
        removeTemp(first.path);
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_10800
     * @tc.name      testFileSizeTwoFiles0001
     * @tc.desc      Write two different media payloads to two cache files and check both sizes match their own
     *               resource length and differ from each other
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testFileSizeTwoFiles0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const iconBytes: Uint8Array = mediaBytes(START_ICON_NAME);
      const foregroundBytes: Uint8Array = mediaBytes(FOREGROUND_NAME);
      const iconFile: TempWrite = writeTempMedia(TEMP_PAIR_FIRST, iconBytes);
      try {
        const foregroundFile: TempWrite = writeTempMedia(TEMP_PAIR_SECOND, foregroundBytes);
        try {
          logCase('testFileSizeTwoFiles0001', `icon=${iconFile.size} foreground=${foregroundFile.size} ` +
            `memoryIcon=${iconBytes.length} memoryForeground=${foregroundBytes.length}`);
          expect(iconFile.size).assertEqual(iconBytes.length);
          expect(foregroundFile.size).assertEqual(foregroundBytes.length);
          expect(iconFile.size !== foregroundFile.size).assertTrue();
          expect(iconFile.path !== foregroundFile.path).assertTrue();
        } finally {
          removeTemp(foregroundFile.path);
        }
      } finally {
        removeTemp(iconFile.path);
      }
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_10900
     * @tc.name      testBackupProfileTextShape0001
     * @tc.desc      Read the backup profile as text and check there is exactly one document, that it is an object
     *               delimited by braces and long enough to hold its single member
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testBackupProfileTextShape0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, () => {
      const profiles: string[] = backupProfileTexts();
      const text: string = profiles.length === 1 ? profiles[0] : EMPTY_TEXT;
      logCase('testBackupProfileTextShape0001', `profiles=${profiles.length} length=${text.length} ` +
        `head=${text.length > 0 ? text.charAt(0) : 'none'}`);
      expect(profiles.length).assertEqual(1);
      expect(text.length > BACKUP_KEY.length).assertTrue();
      expect(text.charAt(0)).assertEqual(BRACE_OPEN);
      expect(text.charAt(text.length - 1)).assertEqual(BRACE_CLOSE);
      expect(countChar(text, QUOTE) % 2).assertEqual(0);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_11000
     * @tc.name      testBackupProfileFlagValue0001
     * @tc.desc      Scan the backup profile members and check the restore flag is the single boolean member and its
     *               literal token reads true
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackupProfileFlagValue0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, () => {
      const profiles: string[] = backupProfileTexts();
      const pairs: JsonPair[] = profiles.length === 1 ? scanPairs(profiles[0]) : [];
      const flag: string = pairValue(pairs, BACKUP_KEY);
      logCase('testBackupProfileFlagValue0001', `members=${pairs.length} flag=${flag} ` +
        `flagCount=${pairCount(pairs, BACKUP_KEY)}`);
      expect(pairs.length).assertEqual(1);
      expect(flag).assertEqual(BACKUP_TRUE);
      expect(pairCount(pairs, BACKUP_KEY)).assertEqual(1);
      expect(flag !== 'false').assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_11100
     * @tc.name      testBackupMetadataLink0001
     * @tc.desc      Check the backup extension publishes exactly one metadata entry whose resource reference is the
     *               backup profile that the bundle manager then returns
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testBackupMetadataLink0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const info: bundleManager.BundleInfo = await selfBundle();
      const extension: bundleManager.ExtensionAbilityInfo = findModule(info, ENTRY_MODULE).extensionAbilitiesInfo[0];
      const profiles: string[] = backupProfileTexts();
      logCase('testBackupMetadataLink0001', `metadata=${extension.metadata.length} ` +
        `name=${extension.metadata[0].name} resource=${extension.metadata[0].resource} ` +
        `profiles=${profiles.length}`);
      expect(extension.name).assertEqual(BACKUP_ABILITY);
      expect(extension.metadata.length).assertEqual(1);
      expect(extension.metadata[0].name).assertEqual(BACKUP_METADATA);
      expect(extension.metadata[0].resource).assertEqual(BACKUP_RESOURCE_REF);
      expect(profiles.length).assertEqual(1);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_11200
     * @tc.name      testBackupProfileModuleError0001
     * @tc.desc      Ask for the backup profile through an unknown module and through a module name with trailing
     *               whitespace and check both report the missing ability error while the real module works
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackupProfileModuleError0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const missing: number = profileErrorCode('entry_missing', BACKUP_ABILITY, BACKUP_METADATA);
      const padded: number = profileErrorCode(ENTRY_MODULE + SPACE, BACKUP_ABILITY, BACKUP_METADATA);
      const real: number = profileErrorCode(ENTRY_MODULE, BACKUP_ABILITY, BACKUP_METADATA);
      logCase('testBackupProfileModuleError0001', `missing=${missing} padded=${padded} real=${real} ` +
        `expected=${ERR_ABILITY_NOT_EXIST}`);
      expect(missing).assertEqual(ERR_ABILITY_NOT_EXIST);
      expect(padded).assertEqual(ERR_ABILITY_NOT_EXIST);
      expect(real).assertEqual(NO_ERROR);
      expect(missing !== ERR_NO_PROFILE).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_11300
     * @tc.name      testBackupProfileMetadataError0001
     * @tc.desc      Ask the backup extension for a metadata entry it never declares and for an extension that does
     *               not exist, distinguishing the no profile error from the missing ability error
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testBackupProfileMetadataError0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, () => {
      const unknownMetadata: number = profileErrorCode(ENTRY_MODULE, BACKUP_ABILITY, 'ohos.extension.absent');
      const unknownAbility: number = profileErrorCode(ENTRY_MODULE, 'AbsentBackupAbility', BACKUP_METADATA);
      const profiles: string[] = backupProfileTexts();
      const members: number = profiles.length === 1 ? scanPairs(profiles[0]).length : 0;
      logCase('testBackupProfileMetadataError0001', `unknownMetadata=${unknownMetadata} ` +
        `unknownAbility=${unknownAbility} members=${members}`);
      expect(unknownMetadata).assertEqual(ERR_NO_PROFILE);
      expect(unknownAbility).assertEqual(ERR_ABILITY_NOT_EXIST);
      expect(members).assertEqual(1);
      expect(unknownMetadata !== unknownAbility).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_11400
     * @tc.name      testMainPagesText0001
     * @tc.desc      Read the main element the module publishes for its page host and check it names the entry
     *               ability without whitespace, path separators or trailing separators
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL0
     */
    it('testMainPagesText0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      const mainElement: string = await entryMainElementName();
      logCase('testMainPagesText0001', `mainElement=${mainElement} length=${mainElement.length}`);
      expect(mainElement.length > 0).assertTrue();
      expect(mainElement).assertEqual(ENTRY_ABILITY);
      expect(countChar(mainElement, SPACE)).assertEqual(0);
      expect(countChar(mainElement, '/')).assertEqual(0);
      expect(mainElement.charAt(mainElement.length - 1) !== ',').assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_11500
     * @tc.name      testMainPagesEntryForm0001
     * @tc.desc      Check the published page host is a plain ability identifier: a single segment without a path
     *               separator, file suffix or resource prefix, matching the exported entry ability
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMainPagesEntryForm0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const mainElement: string = await entryMainElementName();
      const ability: bundleManager.AbilityInfo = await entryAbilityInfo();
      const segments: string[] = mainElement.split('/');
      logCase('testMainPagesEntryForm0001', `mainElement=${mainElement} segments=${segments.length} ` +
        `ability=${ability.name}`);
      expect(segments.length).assertEqual(1);
      expect(mainElement.indexOf('.') < 0).assertTrue();
      expect(isAsciiLetter(mainElement.charAt(0))).assertTrue();
      expect(mainElement).assertEqual(ability.name);
      expect(ability.exported).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_11600
     * @tc.name      testMainPagesStableRead0001
     * @tc.desc      Read the entry module twice and check the published main element name and the module identity
     *               stay identical between the two bundle queries
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testMainPagesStableRead0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const firstInfo: bundleManager.BundleInfo = await selfBundle();
      const secondInfo: bundleManager.BundleInfo = await selfBundle();
      const firstModule: bundleManager.HapModuleInfo = findModule(firstInfo, ENTRY_MODULE);
      const secondModule: bundleManager.HapModuleInfo = findModule(secondInfo, ENTRY_MODULE);
      logCase('testMainPagesStableRead0001', `first=${firstModule.mainElementName} ` +
        `second=${secondModule.mainElementName} moduleName=${firstModule.name}`);
      expect(firstModule.mainElementName).assertEqual(secondModule.mainElementName);
      expect(firstModule.name).assertEqual(ENTRY_MODULE);
      expect(secondModule.name).assertEqual(firstModule.name);
      expect(firstModule.mainElementName).assertEqual(ENTRY_ABILITY);
      expect(firstModule.mainElementName.length > 0).assertTrue();
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_11700
     * @tc.name      testAbilityProfileAbsence0001
     * @tc.desc      Check the page ability declares no metadata and that asking the bundle manager for a profile
     *               through it reports the no profile error rather than returning text
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL2
     */
    it('testAbilityProfileAbsence0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      const ability: bundleManager.AbilityInfo = await entryAbilityInfo();
      const code: number = errorCode(() => {
        bundleManager.getProfileByAbilitySync(ENTRY_MODULE, ENTRY_ABILITY, BACKUP_METADATA);
      });
      const declared: number = profileErrorCode(ENTRY_MODULE, BACKUP_ABILITY, BACKUP_METADATA);
      logCase('testAbilityProfileAbsence0001', `metadata=${ability.metadata.length} code=${code} ` +
        `expected=${ERR_NO_PROFILE} declared=${declared}`);
      expect(ability.metadata.length).assertEqual(0);
      expect(code).assertEqual(ERR_NO_PROFILE);
      expect(declared).assertEqual(NO_ERROR);
      expect(ability.name).assertEqual(ENTRY_ABILITY);
    });

    /**
     * @tc.number    SUB_ARKTS_GC_RESMEDIA_11800
     * @tc.name      testProfileContentSeparation0001
     * @tc.desc      Check the backup profile and the module main element carry different content: the backup
     *               document is brace delimited and holds the restore flag while the main element is a bare name
     * @tc.size      SMALLTEST
     * @tc.type      FUNCTION
     * @tc.level     LEVEL1
     */
    it('testProfileContentSeparation0001', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      const backup: string[] = backupProfileTexts();
      const backupText: string = backup.length === 1 ? backup[0] : EMPTY_TEXT;
      const mainElement: string = await entryMainElementName();
      logCase('testProfileContentSeparation0001', `backupLength=${backupText.length} mainElement=${mainElement} ` +
        `backupHasFlag=${backupText.indexOf(BACKUP_KEY) >= 0} ` +
        `mainHasFlag=${mainElement.indexOf(BACKUP_KEY) >= 0}`);
      expect(backupText.indexOf(BACKUP_KEY) >= 0).assertTrue();
      expect(mainElement.indexOf(BACKUP_KEY) < 0).assertTrue();
      expect(countChar(mainElement, BRACE_OPEN)).assertEqual(0);
      expect(backupText.charAt(0)).assertEqual(BRACE_OPEN);
      expect(mainElement).assertEqual(ENTRY_ABILITY);
    });

  });
}
