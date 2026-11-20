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

import { Context } from '@kit.AbilityKit';

export interface PageSize {
  id: string;
  name: string;
  width: number;
  height: number;
}

export interface PrinterDefaults {
  defaultPageSizeId: string;
  defaultMediaType: string;
  defaultColorMode: number;
  defaultDuplexMode: number;
  defaultOrientation: number;
  defaultPrintQuality: number;
}

export interface PrinterInfo {
  printerId: string;
  printerName: string;
  printerUri: string;
  printerState: number;
  colorMode: number;
  copySupported: number;
  isOnline: boolean;
  pageSizes: PageSize[];
  defaultValue?: PrinterDefaults;
}

export interface PrintJob {
  fdList: number[];
  dpi: number;
  printerId: string;
  copyNumber: number;
  colorMode: number;
  duplexMode: number;
  orientationMode: number;
}

export interface Margin {
  leftMargin: number;
  topMargin: number;
  rightMargin: number;
  bottomMargin: number;
}

export interface PrintOption {
  jobName: string;
  paperSource: string;
  mediaType: string;
  printQuality: number;
  documentFormat: string;
  borderless: boolean;
  advancedOptions: string;
}

export interface PrintProperty {
  key: string;
  value: string;
}

export interface PrinterIdListResult {
  code: number;
  printerIds: string[];
}

export interface PrinterInfoResult {
  code: number;
  printerInfo?: PrinterInfo;
}

export interface PrinterPropertiesResult {
  code: number;
  properties: PrintProperty[];
}

export interface NativePrintEvent {
  eventType: number;
  jobId: string;
  state: number;
  writeCode: number;
}

export interface PrintJobStateEvent {
  jobId: string;
  state: number;
}

export type PrinterEventCallback = (event: number, printerInfo: PrinterInfo) => void;
export type NativePrintEventCallback = (event: NativePrintEvent) => void;
export type PrintJobStateEventCallback = (event: PrintJobStateEvent) => void;

export function nativeInit(): number;
export function nativeRelease(): number;
export function nativeRegisterPrinterChangeListener(callback: PrinterEventCallback): number;
export function nativeUnregisterPrinterChangeListener(): number;
export function nativeStartPrinterDiscovery(callback: PrinterEventCallback): number;
export function nativeStopPrinterDiscovery(): number;
export function nativeConnectPrinter(printerId: string): number;
export function nativeLaunchPrinterManager(): number;
export function nativeQueryPrinterList(): PrinterIdListResult;
export function nativeQueryPrinterInfo(printerId: string): PrinterInfoResult;
export function nativeQueryPrinterProperties(printerId: string, keys: string[]): PrinterPropertiesResult;
export function nativeUpdatePrinterProperties(printerId: string, properties: PrintProperty[]): number;
export function nativeRestorePrinterProperties(printerId: string, keys: string[]): number;
export function nativeStartPrintByNative(jobName: string, sourceFd: number, context: Context,
  callback: NativePrintEventCallback): number;
export function nativeStartPrintJob(printJob: PrintJob, pageSize: PageSize, margin: Margin,
  printOption: PrintOption): number;
export function nativeStartPrintJobWithDefaultSettings(fd: number, documentFormat: string): number;
export function nativeStartPrintWithJobStateCallback(printJob: PrintJob, pageSize: PageSize, margin: Margin,
  printOption: PrintOption, callback: PrintJobStateEventCallback): number;
