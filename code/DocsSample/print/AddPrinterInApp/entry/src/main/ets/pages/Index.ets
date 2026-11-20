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

// [Start add_printer_page]
import { print, BusinessError } from '@kit.BasicServicesKit';

@Entry
@Component
struct Index {
  @State printerName: string = 'DemoPrinter';
  @State uri: string = '';
  @State ppdName: string = '';
  @State isAdding: boolean = false;
  @State resultTitle: Resource = $r('app.string.result_wait_title');
  @State resultDetail: Resource = $r('app.string.result_wait_detail');

  private async addPrinter(): Promise<void> {
    if (this.isAdding) {
      return;
    }

    const name = this.printerName.trim();
    const uri = this.uri.trim();
    const ppd = this.ppdName.trim();
    if (name.length === 0 || uri.length === 0) {
      this.resultTitle = $r('app.string.result_incomplete_title');
      this.resultDetail = name.length === 0
        ? $r('app.string.result_name_empty_detail')
        : $r('app.string.result_uri_empty_detail');
      return;
    }

    this.isAdding = true;
    this.resultTitle = $r('app.string.adding');
    this.resultDetail = $r('app.string.result_adding_detail');
    try {
      const added = ppd.length === 0
        ? await print.addPrinter(name, uri)
        : await print.addPrinter(name, uri, ppd);
      this.resultTitle = added ? $r('app.string.result_success_title') : $r('app.string.result_fail_title');
      this.resultDetail = added
        ? $r('app.string.result_success_detail', name)
        : $r('app.string.result_fail_detail');
    } catch (cause) {
      const error = cause as BusinessError;
      this.resultTitle = $r('app.string.result_fail_title');
      if (typeof cause === 'number') {
        this.resultDetail = $r('app.string.error_detail_code_only', String(cause));
      } else {
        const code = typeof error.code === 'number' ? String(error.code) : '';
        const message = error.message || String(cause);
        if (code === '201') {
          this.resultDetail = $r('app.string.error_detail_201', message);
        } else if (code === '13100003') {
          this.resultDetail = $r('app.string.error_detail_13100003', message);
        } else if (code === '') {
          this.resultDetail = $r('app.string.error_detail_unknown_code', message);
        } else {
          this.resultDetail = $r('app.string.error_detail', code, message);
        }
      }
    } finally {
      this.isAdding = false;
    }
  }

  build() {
    Scroll() {
      Column({ space: 16 }) {
        Text($r('app.string.page_title'))
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
        Text('addPrinter · API 24+')
          .fontSize(14)

        Text($r('app.string.printer_name_label'))
          .fontSize(16)
        TextInput({ text: this.printerName, placeholder: 'DemoPrinter' })
          .id('printerNameInput')
          .accessibilityText($r('app.string.printer_name_a11y'))
          .enabled(!this.isAdding)
          .onChange((value: string) => {
            this.printerName = value;
          })

        Text($r('app.string.printer_uri_label'))
          .fontSize(16)
        TextInput({ text: this.uri, placeholder: $r('app.string.printer_uri_placeholder') })
          .id('printerUriInput')
          .accessibilityText($r('app.string.printer_uri_a11y'))
          .enabled(!this.isAdding)
          .onChange((value: string) => {
            this.uri = value;
          })
        Text($r('app.string.printer_uri_hint'))
          .fontSize(14)

        Text($r('app.string.ppd_name_label'))
          .fontSize(16)
        TextInput({ text: this.ppdName, placeholder: $r('app.string.ppd_placeholder') })
          .id('ppdNameInput')
          .accessibilityText($r('app.string.ppd_name_a11y'))
          .enabled(!this.isAdding)
          .onChange((value: string) => {
            this.ppdName = value;
          })
        Text($r('app.string.ppd_hint'))
          .fontSize(14)

        Button(this.isAdding ? $r('app.string.adding') : $r('app.string.button_add'))
          .id('addPrinterButton')
          .width('100%')
          .enabled(!this.isAdding)
          .onClick(() => {
            this.addPrinter();
          })

        Column({ space: 8 }) {
          Text(this.resultTitle)
            .id('resultTitle')
            .fontSize(20)
            .fontWeight(FontWeight.Bold)
          Text(this.resultDetail)
            .id('resultDetail')
            .fontSize(16)
            .copyOption(CopyOptions.InApp)
        }
        .alignItems(HorizontalAlign.Start)
        .width('100%')
        .padding({ top: 12, bottom: 12 })

        Text($r('app.string.footer_note'))
          .fontSize(14)
      }
      .alignItems(HorizontalAlign.Start)
      .width('100%')
      .constraintSize({ maxWidth: 680 })
      .padding(24)
    }
    .height('100%')
    .width('100%')
  }
}
// [End add_printer_page]
