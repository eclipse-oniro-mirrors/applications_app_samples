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

import nativePrint from 'libentry.so';

export const INVALID_PRINTER_ERROR: number = 24300005;

export enum DiscoveryEvent {
  DISCOVERED = 0,
  LOST = 1,
  CONNECTING = 2,
  CONNECTED = 3
}

export enum NativePrintEventType {
  WRITE_RESULT = 0,
  JOB_STATE = 1
}

export class PageSizeModel implements nativePrint.PageSize {
  public id: string;
  public name: string;
  public width: number;
  public height: number;

  constructor(id: string, name: string, width: number, height: number) {
    this.id = id;
    this.name = name;
    this.width = width;
    this.height = height;
  }

  static fromNative(pageSize: nativePrint.PageSize): PageSizeModel {
    return new PageSizeModel(pageSize.id, pageSize.name, pageSize.width, pageSize.height);
  }

  public static readonly A4: PageSizeModel = new PageSizeModel('iso_a4_210x297mm', 'A4', 8268, 11693);
}

export class PrinterInfoModel implements nativePrint.PrinterInfo {
  public printerId: string;
  public printerName: string;
  public printerUri: string;
  public printerState: number;
  public colorMode: number;
  public copySupported: number;
  public isOnline: boolean;
  public pageSizes: PageSizeModel[];

  constructor(printerId: string, printerName: string, printerUri: string, printerState: number, colorMode: number,
    copySupported: number, isOnline: boolean, pageSizes: PageSizeModel[]) {
    this.printerId = printerId;
    this.printerName = printerName;
    this.printerUri = printerUri;
    this.printerState = printerState;
    this.colorMode = colorMode;
    this.copySupported = copySupported;
    this.isOnline = isOnline;
    this.pageSizes = pageSizes;
  }

  static fromNative(printerInfo: nativePrint.PrinterInfo): PrinterInfoModel {
    const pageSizes: PageSizeModel[] = [];
    for (let index: number = 0; index < printerInfo.pageSizes.length; index++) {
      const pageSize: nativePrint.PageSize = printerInfo.pageSizes[index];
      pageSizes.push(PageSizeModel.fromNative(pageSize));
    }
    return new PrinterInfoModel(printerInfo.printerId, printerInfo.printerName, printerInfo.printerUri,
      printerInfo.printerState, printerInfo.colorMode, printerInfo.copySupported, printerInfo.isOnline, pageSizes);
  }

  public static readonly EMPTY: PrinterInfoModel = new PrinterInfoModel('', '', '', 0, 0, 0, false, []);
}

export class PrintJobModel implements nativePrint.PrintJob {
  public fdList: number[];
  public dpi: number;
  public printerId: string;
  public copyNumber: number;
  public colorMode: number;
  public duplexMode: number;
  public orientationMode: number;

  constructor(fd: number, printerId: string, copyNumber: number, colorMode: number, duplexMode: number,
    orientationMode: number) {
    this.fdList = [fd];
    this.dpi = 300;
    this.printerId = printerId;
    this.copyNumber = copyNumber;
    this.colorMode = colorMode;
    this.duplexMode = duplexMode;
    this.orientationMode = orientationMode;
  }
}

export class MarginModel implements nativePrint.Margin {
  public leftMargin: number;
  public topMargin: number;
  public rightMargin: number;
  public bottomMargin: number;

  constructor(leftMargin: number, topMargin: number, rightMargin: number, bottomMargin: number) {
    this.leftMargin = leftMargin;
    this.topMargin = topMargin;
    this.rightMargin = rightMargin;
    this.bottomMargin = bottomMargin;
  }
}

export class PrintOptionModel implements nativePrint.PrintOption {
  public jobName: string;
  public paperSource: string;
  public mediaType: string;
  public printQuality: number;
  public documentFormat: string;
  public borderless: boolean;
  public advancedOptions: string;

  constructor(documentFormat: string, printQuality: number, borderless: boolean, mediaType: string) {
    this.jobName = 'NativePrintFile';
    this.paperSource = '';
    this.mediaType = mediaType;
    this.printQuality = printQuality;
    this.documentFormat = documentFormat;
    this.borderless = borderless;
    this.advancedOptions = '';
  }
}

export class PrintPropertyModel implements nativePrint.PrintProperty {
  public key: string;
  public value: string;

  constructor(key: string, value: string) {
    this.key = key;
    this.value = value;
  }
}

export class PrintRequest {
  public printJob: PrintJobModel;
  public pageSize: PageSizeModel;
  public margin: MarginModel;
  public option: PrintOptionModel;

  constructor(printJob: PrintJobModel, pageSize: PageSizeModel, margin: MarginModel, option: PrintOptionModel) {
    this.printJob = printJob;
    this.pageSize = pageSize;
    this.margin = margin;
    this.option = option;
  }
}
