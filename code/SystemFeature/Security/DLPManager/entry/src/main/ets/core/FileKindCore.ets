/*
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
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

import { extensionOf } from './UriCore';
import { decodeUtf8, DecodeOutcome } from './TextCodecCore';
import { textOf } from './TextCatalog';

export const MAX_EDITABLE_BYTES: number = 1048576;
const DLP_SUFFIX: string = '.dlp';

export enum FileKind {
  TEXT = 'text',
  IMAGE = 'image',
  AUDIO = 'audio',
  VIDEO = 'video',
  DOCUMENT = 'document',
  ARCHIVE = 'archive',
  DATABASE = 'database',
  PROGRAM = 'program',
  UNKNOWN = 'unknown'
}

export class FileDescriptor {
  public readonly name: string;
  public readonly displayName: string;
  public readonly extension: string;
  public readonly kind: FileKind;
  public readonly mimeType: string;
  public readonly isDlp: boolean;
  public readonly sizeBytes: number;

  constructor(name: string, displayName: string, extension: string, kind: FileKind, mimeType: string,
    isDlp: boolean, sizeBytes: number) {
    this.name = name;
    this.displayName = displayName;
    this.extension = extension;
    this.kind = kind;
    this.mimeType = mimeType;
    this.isDlp = isDlp;
    this.sizeBytes = sizeBytes;
  }
}

export class KindGroup {
  public readonly kind: FileKind;
  public readonly descriptors: FileDescriptor[];

  constructor(kind: FileKind, descriptors: FileDescriptor[]) {
    this.kind = kind;
    this.descriptors = descriptors;
  }
}

export function isDlpName(name: string): boolean {
  return name.toLowerCase().endsWith(DLP_SUFFIX);
}

export function stripDlpSuffix(name: string): string {
  if (isDlpName(name)) {
    return name.substring(0, name.length - DLP_SUFFIX.length);
  }
  return name;
}

export function effectiveName(name: string): string {
  return stripDlpSuffix(name);
}

export function extensionOfName(name: string): string {
  return extensionOf(effectiveName(name)).toLowerCase();
}

export function kindOfExtension(extension: string): FileKind {
  const ext: string = extension.toLowerCase();
  if (ext === 'txt' || ext === 'md' || ext === 'log' || ext === 'csv' || ext === 'json' || ext === 'xml' ||
    ext === 'html' || ext === 'htm' || ext === 'css' || ext === 'js' || ext === 'ts' || ext === 'ets' ||
    ext === 'yml' || ext === 'yaml' || ext === 'ini' || ext === 'conf' || ext === 'sh' || ext === 'bat') {
    return FileKind.TEXT;
  }
  if (ext === 'png' || ext === 'jpg' || ext === 'jpeg' || ext === 'gif' || ext === 'bmp' || ext === 'webp' ||
    ext === 'svg' || ext === 'heic') {
    return FileKind.IMAGE;
  }
  if (ext === 'mp3' || ext === 'wav' || ext === 'aac' || ext === 'flac' || ext === 'ogg' || ext === 'm4a') {
    return FileKind.AUDIO;
  }
  if (ext === 'mp4' || ext === 'mkv' || ext === 'mov' || ext === 'avi' || ext === 'webm' || ext === '3gp') {
    return FileKind.VIDEO;
  }
  if (ext === 'pdf' || ext === 'doc' || ext === 'docx' || ext === 'xls' || ext === 'xlsx' || ext === 'ppt' ||
    ext === 'pptx' || ext === 'odt' || ext === 'rtf') {
    return FileKind.DOCUMENT;
  }
  if (ext === 'zip' || ext === 'rar' || ext === '7z' || ext === 'gz' || ext === 'tar' || ext === 'bz2' ||
    ext === 'xz') {
    return FileKind.ARCHIVE;
  }
  if (ext === 'db' || ext === 'sqlite' || ext === 'sqlite3' || ext === 'mdb') {
    return FileKind.DATABASE;
  }
  if (ext === 'hap' || ext === 'exe' || ext === 'so' || ext === 'dll' || ext === 'bin' ||
    ext === 'abc') {
    return FileKind.PROGRAM;
  }
  return FileKind.UNKNOWN;
}

export function mimeOfExtension(extension: string): string {
  const ext: string = extension.toLowerCase();
  if (ext === 'txt' || ext === 'log' || ext === 'ini' || ext === 'conf') {
    return 'text/plain';
  }
  if (ext === 'md') {
    return 'text/markdown';
  }
  if (ext === 'csv') {
    return 'text/csv';
  }
  if (ext === 'json') {
    return 'application/json';
  }
  if (ext === 'xml') {
    return 'application/xml';
  }
  if (ext === 'html' || ext === 'htm') {
    return 'text/html';
  }
  if (ext === 'css') {
    return 'text/css';
  }
  if (ext === 'js') {
    return 'text/javascript';
  }
  if (ext === 'ts' || ext === 'ets') {
    return 'text/typescript';
  }
  if (ext === 'yml' || ext === 'yaml') {
    return 'application/yaml';
  }
  if (ext === 'png') {
    return 'image/png';
  }
  if (ext === 'jpg' || ext === 'jpeg') {
    return 'image/jpeg';
  }
  if (ext === 'gif') {
    return 'image/gif';
  }
  if (ext === 'bmp') {
    return 'image/bmp';
  }
  if (ext === 'webp') {
    return 'image/webp';
  }
  if (ext === 'svg') {
    return 'image/svg+xml';
  }
  if (ext === 'heic') {
    return 'image/heic';
  }
  if (ext === 'mp3') {
    return 'audio/mpeg';
  }
  if (ext === 'wav') {
    return 'audio/wav';
  }
  if (ext === 'aac') {
    return 'audio/aac';
  }
  if (ext === 'flac') {
    return 'audio/flac';
  }
  if (ext === 'ogg') {
    return 'audio/ogg';
  }
  if (ext === 'm4a') {
    return 'audio/mp4';
  }
  if (ext === 'mp4') {
    return 'video/mp4';
  }
  if (ext === 'mkv') {
    return 'video/x-matroska';
  }
  if (ext === 'mov') {
    return 'video/quicktime';
  }
  if (ext === 'avi') {
    return 'video/x-msvideo';
  }
  if (ext === 'webm') {
    return 'video/webm';
  }
  if (ext === '3gp') {
    return 'video/3gpp';
  }
  if (ext === 'pdf') {
    return 'application/pdf';
  }
  if (ext === 'doc') {
    return 'application/msword';
  }
  if (ext === 'docx') {
    return 'application/vnd.openxmlformats-officedocument.wordprocessingml.document';
  }
  if (ext === 'xls') {
    return 'application/vnd.ms-excel';
  }
  if (ext === 'xlsx') {
    return 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet';
  }
  if (ext === 'ppt') {
    return 'application/vnd.ms-powerpoint';
  }
  if (ext === 'pptx') {
    return 'application/vnd.openxmlformats-officedocument.presentationml.presentation';
  }
  if (ext === 'zip') {
    return 'application/zip';
  }
  if (ext === 'rar') {
    return 'application/vnd.rar';
  }
  if (ext === '7z') {
    return 'application/x-7z-compressed';
  }
  if (ext === 'gz') {
    return 'application/gzip';
  }
  if (ext === 'tar') {
    return 'application/x-tar';
  }
  if (ext === 'db' || ext === 'sqlite' || ext === 'sqlite3') {
    return 'application/vnd.sqlite3';
  }
  if (ext === 'hap') {
    return 'application/vnd.ohos.package';
  }
  return 'application/octet-stream';
}

export function describeFile(name: string, sizeBytes: number): FileDescriptor {
  const dlp: boolean = isDlpName(name);
  const display: string = stripDlpSuffix(name);
  const extension: string = extensionOf(display).toLowerCase();
  return new FileDescriptor(name, display, extension, kindOfExtension(extension),
    mimeOfExtension(extension), dlp, sizeBytes);
}

export function isSampleSupported(name: string): boolean {
  const extension: string = extensionOfName(name);
  return extension === 'txt' || extension === 'doc' || extension === 'docx';
}

export function isEditableText(descriptor: FileDescriptor): boolean {
  return descriptor.kind === FileKind.TEXT && descriptor.sizeBytes >= 0 &&
    descriptor.sizeBytes <= MAX_EDITABLE_BYTES;
}

export function matchesAnySuffix(name: string, suffixes: string[]): boolean {
  const lowerName: string = name.toLowerCase();
  for (let index = 0; index < suffixes.length; index++) {
    let suffix: string = suffixes[index].toLowerCase();
    if (suffix.length === 0) {
      continue;
    }
    if (!suffix.startsWith('.')) {
      suffix = '.' + suffix;
    }
    if (lowerName.endsWith(suffix)) {
      return true;
    }
  }
  return false;
}

export function kindLabel(kind: FileKind): string {
  if (kind === FileKind.TEXT) {
    return textOf('dlp_kind_text');
  }
  if (kind === FileKind.IMAGE) {
    return textOf('dlp_kind_image');
  }
  if (kind === FileKind.AUDIO) {
    return textOf('dlp_kind_video');
  }
  if (kind === FileKind.VIDEO) {
    return textOf('dlp_kind_audio');
  }
  if (kind === FileKind.DOCUMENT) {
    return textOf('dlp_kind_document');
  }
  if (kind === FileKind.ARCHIVE) {
    return textOf('dlp_kind_archive');
  }
  if (kind === FileKind.DATABASE) {
    return textOf('dlp_kind_database');
  }
  if (kind === FileKind.PROGRAM) {
    return textOf('dlp_kind_program');
  }
  return textOf('dlp_kind_unknown');
}

export function kindResourceKey(kind: FileKind): string {
  return 'kind_' + kind.toString();
}

export function kindPriority(kind: FileKind): number {
  if (kind === FileKind.TEXT) {
    return 0;
  }
  if (kind === FileKind.DOCUMENT) {
    return 1;
  }
  if (kind === FileKind.IMAGE) {
    return 2;
  }
  if (kind === FileKind.VIDEO) {
    return 3;
  }
  if (kind === FileKind.AUDIO) {
    return 4;
  }
  if (kind === FileKind.ARCHIVE) {
    return 5;
  }
  if (kind === FileKind.DATABASE) {
    return 6;
  }
  if (kind === FileKind.PROGRAM) {
    return 7;
  }
  return 9;
}

export function groupByKind(descriptors: FileDescriptor[]): KindGroup[] {
  const groups: KindGroup[] = [];
  for (let index = 0; index < descriptors.length; index++) {
    const descriptor: FileDescriptor = descriptors[index];
    let target: number = -1;
    for (let groupIndex = 0; groupIndex < groups.length; groupIndex++) {
      if (groups[groupIndex].kind === descriptor.kind) {
        target = groupIndex;
        break;
      }
    }
    if (target < 0) {
      groups.push(new KindGroup(descriptor.kind, [descriptor]));
    } else {
      groups[target].descriptors.push(descriptor);
    }
  }
  for (let left = 0; left < groups.length; left++) {
    for (let right = left + 1; right < groups.length; right++) {
      if (kindPriority(groups[right].kind) < kindPriority(groups[left].kind)) {
        const temp: KindGroup = groups[left];
        groups[left] = groups[right];
        groups[right] = temp;
      }
    }
  }
  return groups;
}

function hasMagic(bytes: Uint8Array, signature: number[]): boolean {
  if (bytes.length < signature.length) {
    return false;
  }
  for (let index = 0; index < signature.length; index++) {
    if (bytes[index] !== signature[index]) {
      return false;
    }
  }
  return true;
}

function hasTextAt(bytes: Uint8Array, offset: number, ascii: string): boolean {
  if (bytes.length < offset + ascii.length) {
    return false;
  }
  for (let index = 0; index < ascii.length; index++) {
    if (bytes[offset + index] !== ascii.charCodeAt(index)) {
      return false;
    }
  }
  return true;
}

function printableRatio(text: string): number {
  if (text.length === 0) {
    return 0;
  }
  let printable: number = 0;
  for (let index = 0; index < text.length; index++) {
    const code: number = text.charCodeAt(index);
    if (code === 0x09 || code === 0x0A || code === 0x0D) {
      printable += 1;
    } else if (code >= 0x20 && code !== 0x7F) {
      printable += 1;
    }
  }
  return printable / text.length;
}

export function detectByContent(bytes: Uint8Array): FileKind {
  if (bytes.length === 0) {
    return FileKind.UNKNOWN;
  }
  if (hasMagic(bytes, [0x89, 0x50, 0x4E, 0x47])) {
    return FileKind.IMAGE;
  }
  if (hasMagic(bytes, [0xFF, 0xD8, 0xFF])) {
    return FileKind.IMAGE;
  }
  if (hasTextAt(bytes, 0, 'GIF8') || hasMagic(bytes, [0x42, 0x4D])) {
    return FileKind.IMAGE;
  }
  if (hasTextAt(bytes, 0, 'RIFF') && hasTextAt(bytes, 8, 'WEBP')) {
    return FileKind.IMAGE;
  }
  if (hasTextAt(bytes, 0, '%PDF')) {
    return FileKind.DOCUMENT;
  }
  if (hasMagic(bytes, [0x50, 0x4B, 0x03, 0x04])) {
    return FileKind.ARCHIVE;
  }
  if (hasMagic(bytes, [0x1F, 0x8B])) {
    return FileKind.ARCHIVE;
  }
  if (hasTextAt(bytes, 4, 'ftyp')) {
    return FileKind.VIDEO;
  }
  if (hasTextAt(bytes, 0, 'OggS')) {
    return FileKind.AUDIO;
  }
  const decoded: DecodeOutcome = decodeUtf8(bytes);
  if (decoded.valid && printableRatio(decoded.text) >= 0.9) {
    return FileKind.TEXT;
  }
  return FileKind.UNKNOWN;
}
