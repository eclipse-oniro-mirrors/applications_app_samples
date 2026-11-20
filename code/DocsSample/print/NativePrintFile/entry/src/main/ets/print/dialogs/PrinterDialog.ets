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

import { PrinterInfoModel } from '../model/PrintModels';

@CustomDialog
export struct PrinterDialog {
  controller: CustomDialogController;
  @Link printers: PrinterInfoModel[];
  onConnect: (printer: PrinterInfoModel) => void = (_printer: PrinterInfoModel): void => {};

  build() {
    Column({ space: 12 }) {
      Text($r('app.string.add_printer'))
        .fontSize(20)
        .fontWeight(FontWeight.Bold)
        .width('100%')
      if (this.printers.length === 0) {
        Text($r('app.string.no_discovered_printer'))
          .fontColor($r('app.color.text_secondary'))
          .width('100%')
      } else {
        List({ space: 8 }) {
          ForEach(this.printers, (printer: PrinterInfoModel) => {
            ListItem() {
              Button() {
                Row({ space: 8 }) {
                  Column({ space: 4 }) {
                    Text(printer.printerName)
                      .fontColor($r('app.color.text_primary'))
                      .maxLines(1)
                      .textOverflow({ overflow: TextOverflow.Ellipsis })
                    Text(printer.printerId)
                      .fontSize(12)
                      .fontColor($r('app.color.text_secondary'))
                      .maxLines(1)
                      .textOverflow({ overflow: TextOverflow.Ellipsis })
                  }
                  .alignItems(HorizontalAlign.Start)
                  .layoutWeight(1)
                  Text($r('app.string.connect'))
                    .fontColor($r('app.color.brand'))
                }
                .width('100%')
              }
              .id('printer_' + printer.printerId)
              .width('100%')
              .height(64)
              .backgroundColor($r('app.color.card_background'))
              .onClick(() => {
                this.onConnect(printer);
                this.controller.close();
              })
            }
          // Refresh the row and its connection callback when the same printer's information changes.
          }, (printer: PrinterInfoModel) => JSON.stringify(printer))
        }
        .width('100%')
        .height(320)
      }
      Button($r('app.string.cancel'))
        .id('printer_dialog_cancel')
        .width('100%')
        .onClick(() => {
          this.controller.close();
        })
    }
    .id('printer_dialog')
    .width('320vp')
    .padding(20)
  }
}
