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

// Deterministic logic of pages/Index.ets and cpp/rawfile_demo.cpp (read window, buffer layout, labels).

// Mirrors the raw files read by aboutToAppear() and their packaged contents.
export const RAW_FILE: string = 'rawfile.txt';
export const RAW_FILE_64: string = 'rawfile1.txt';
export const RAW_CONTENT: string = 'rawfile1 content';
export const RAW_CONTENT_64: string = 'rawfile content for 64';
// Mirrors the offsets passed by aboutToAppear(): getRawFileContent(..., 3) and getRawFileContent64(..., 8).
export const PAGE_OFFSET: number = 3;
export const PAGE_OFFSET_64: number = 8;
// Mirrors char strBuf[256] used to receive the file name in the napi functions.
export const NAME_BUFFER_SIZE: number = 256;

// Mirrors GetRawFileContent(): the seek is applied only when offset + length fits into the file.
export function seekApplies(fileSize: number, offset: number, length: number): boolean {
  return offset + length <= fileSize;
}

// Mirrors GetRawFileContent(): readLen defaults to fileSize and becomes length when a non-zero length fits.
export function readLengthOf(fileSize: number, offset: number, length: number): number {
  if (seekApplies(fileSize, offset, length) && length !== 0) {
    return length;
  }
  return fileSize;
}

// Mirrors the read position after OH_ResourceManager_SeekRawFile(rawFile, offset, 0).
export function readStartOf(fileSize: number, offset: number, length: number): number {
  return seekApplies(fileSize, offset, length) ? offset : 0;
}

// Mirrors OH_ResourceManager_ReadRawFile(): never reads past the end of the file.
export function bytesReadOf(fileSize: number, offset: number, length: number): number {
  const start: number = readStartOf(fileSize, offset, length);
  const available: number = fileSize - start;
  const wanted: number = readLengthOf(fileSize, offset, length);
  if (available <= 0 || wanted <= 0) {
    return 0;
  }
  return wanted < available ? wanted : available;
}

// Mirrors CreateJsArrayValue(env, data, fileSize): the Uint8Array always spans fileSize bytes.
export function bufferLengthOf(fileSize: number): number {
  return fileSize > 0 ? fileSize : 0;
}

// Mirrors the zero bytes left at the end of the fileSize buffer after a shorter read.
export function paddingBytesOf(fileSize: number, offset: number, length: number): number {
  return bufferLengthOf(fileSize) - bytesReadOf(fileSize, offset, length);
}

// Mirrors util.TextDecoder.decodeToString() of the returned buffer for ASCII content.
export function decodedContentOf(content: string, offset: number, length: number): string {
  const fileSize: number = content.length;
  const start: number = readStartOf(fileSize, offset, length);
  const count: number = bytesReadOf(fileSize, offset, length);
  let text: string = content.substring(start, start + count);
  for (let i: number = 0; i < paddingBytesOf(fileSize, offset, length); i++) {
    text += '\u0000';
  }
  return text;
}

// Mirrors the visible part of the decoded content (trailing zero bytes are not rendered).
export function visibleContentOf(content: string, offset: number, length: number): string {
  const decoded: string = decodedContentOf(content, offset, length);
  let end: number = decoded.length;
  while (end > 0 && decoded.charCodeAt(end - 1) === 0) {
    end--;
  }
  return decoded.substring(0, end);
}

// Mirrors napi_get_value_string_utf8(strBuf, 256): at most 255 bytes of the name are kept.
export function receivedFileNameOf(name: string): string {
  return name.length >= NAME_BUFFER_SIZE ? name.substring(0, NAME_BUFFER_SIZE - 1) : name;
}

// Mirrors GetFileList(): the names collected from the raw dir are returned as a JS array and stringified.
export function fileListJsonOf(names: string[]): string {
  return JSON.stringify(names);
}

// Mirrors Text('file list: ' + this.rawFileList).
export function fileListLabelOf(listJson: string): string {
  return `file list: ${listJson}`;
}

// Mirrors Text('rawfile.txt content: ' + this.rawFileContent).
export function contentLabelOf(text: string): string {
  return `rawfile.txt content: ${text}`;
}

// Mirrors Text('rawfile.txt content with offset: ' + this.rawFileContentWithOffset).
export function offsetContentLabelOf(text: string): string {
  return `rawfile.txt content with offset: ${text}`;
}

// Mirrors Text('rawfile.txt content64: ' + this.rawFileContent64).
export function content64LabelOf(text: string): string {
  return `rawfile.txt content64: ${text}`;
}

// Mirrors Text('rawfile.txt content with offset64: ' + this.rawFileContentWithOffset64).
export function offsetContent64LabelOf(text: string): string {
  return `rawfile.txt content with offset64: ${text}`;
}

// Mirrors the descriptor labels: 'rawfile.txt fd: ', 'fd.offset: ', 'fd.length: ' (+ '64' variants).
export function descriptorLabelOf(field: string, value: number, is64: boolean): string {
  const suffix: string = is64 ? '64' : '';
  if (field === 'fd') {
    return `rawfile.txt fd${suffix}: ${value}`;
  }
  return `rawfile.txt fd.${field}${suffix}: ${value}`;
}

// Mirrors aboutToDisappear(): a descriptor is released only when one was obtained.
export function shouldRelease(fd: number): boolean {
  return fd >= 0;
}

// Mirrors the RawFileDescriptor end position (offset + length) inside the HAP.
export function descriptorEndOf(offset: number, length: number): number {
  return offset + length;
}

// Mirrors the page state filled by aboutToAppear() and drained by aboutToDisappear().
export class RawfilePageState {
  rawFileList: string = '';
  rawFileContent: string = '';
  rawFileContentWithOffset: string = '';
  rawFileContent64: string = '';
  rawFileContentWithOffset64: string = '';
  fd: number = -1;
  fd64: number = -1;
  released: number = 0;

  // Mirrors the getFileList()/getRawFileContent() calls of aboutToAppear() for the packaged contents.
  appear(names: string[], offset: number, offset64: number): void {
    this.rawFileList = fileListJsonOf(names);
    this.rawFileContent = visibleContentOf(RAW_CONTENT, 0, 0);
    this.rawFileContentWithOffset = visibleContentOf(RAW_CONTENT, offset, 0);
    this.rawFileContent64 = visibleContentOf(RAW_CONTENT_64, 0, 0);
    this.rawFileContentWithOffset64 = visibleContentOf(RAW_CONTENT_64, offset64, 0);
  }

  // Mirrors getRawFileDescriptor() / getRawFileDescriptor64().
  openDescriptors(fd: number, fd64: number): void {
    this.fd = fd;
    this.fd64 = fd64;
  }

  // Mirrors aboutToDisappear(): releases whatever descriptors were obtained.
  disappear(): number {
    if (shouldRelease(this.fd)) {
      this.released++;
      this.fd = -1;
    }
    if (shouldRelease(this.fd64)) {
      this.released++;
      this.fd64 = -1;
    }
    return this.released;
  }

  // Mirrors the first Text of the column.
  listLabel(): string {
    return fileListLabelOf(this.rawFileList);
  }
}
