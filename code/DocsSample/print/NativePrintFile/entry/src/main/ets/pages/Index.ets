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

// [Start print_native_import_ets]
import { Context } from '@kit.AbilityKit';
import { fileIo } from '@kit.CoreFileKit';
import nativePrint from 'libentry.so';
import { PrintSettings } from '../print/components/PrintSettings';
import { PrinterDialog } from '../print/dialogs/PrinterDialog';
import {
  DiscoveryEvent,
  INVALID_PRINTER_ERROR,
  MarginModel,
  NativePrintEventType,
  PageSizeModel,
  PrinterInfoModel,
  PrintJobModel,
  PrintOptionModel,
  PrintPropertyModel,
  PrintRequest
} from '../print/model/PrintModels';
import { PrintFileUtils } from '../print/utils/PrintFileUtils';
// [End print_native_import_ets]

@Entry
@Component
struct Index {
  @State selectedFileName: string = 'printSample.jpg';
  @State selectedDocumentFormat: string = 'image/jpeg';
  @State discoveredPrinters: PrinterInfoModel[] = [];
  @State selectedPrinter: PrinterInfoModel = PrinterInfoModel.EMPTY;
  @State pageSizes: PageSizeModel[] = [PageSizeModel.A4];
  @State selectedPageSize: PageSizeModel = PageSizeModel.A4;
  @State copyNumber: number = 1;
  @State borderless: boolean = false;
  @State leftMargin: string = '100';
  @State topMargin: string = '100';
  @State rightMargin: string = '100';
  @State bottomMargin: string = '100';
  @State colorMode: number = 2;
  @State duplexMode: number = 0;
  @State orientationMode: number = 0;
  @State printQuality: number = 4;
  @State mediaType: string = 'stationery';
  @State propertyKey: string = 'defaultPageSizeId';
  @State propertyValue: string = 'iso_a4_210x297mm';
  @State operationResult: string = '';
  private printerDialogController: CustomDialogController = new CustomDialogController({
    builder: PrinterDialog({
      printers: $discoveredPrinters,
      onConnect: (printer: PrinterInfoModel): void => {
        this.connectPrinter(printer);
      }
    }),
    autoCancel: true
  });

  private getResourceText(resource: Resource): string {
    const context: Context | undefined = this.getUIContext().getHostContext();
    if (context === undefined) {
      return '';
    }
    try {
      return context.resourceManager.getStringSync(resource.id);
    } catch {
      return '';
    }
  }

  private setCodeResult(apiName: string, code: number): void {
    this.operationResult = apiName + ' code=' + code.toString();
  }

  // [Start print_native_lifecycle_ets]
  aboutToAppear(): void {
    this.operationResult = this.getResourceText($r('app.string.waiting_operation'));
    const initCode: number = nativePrint.nativeInit();
    if (initCode !== 0) {
      this.setCodeResult('OH_Print_Init', initCode);
      return;
    }
    const listenerCode: number = nativePrint.nativeRegisterPrinterChangeListener(
      (event: number, printerInfo: nativePrint.PrinterInfo): void => {
        this.handlePrinterChange(event, PrinterInfoModel.fromNative(printerInfo));
      });
    if (listenerCode !== 0) {
      this.setCodeResult('OH_Print_RegisterPrinterChangeListener', listenerCode);
    }
    this.startDiscovery();
  }

  aboutToDisappear(): void {
    this.printerDialogController.close();
    nativePrint.nativeStopPrinterDiscovery();
    nativePrint.nativeUnregisterPrinterChangeListener();
    nativePrint.nativeRelease();
  }
  // [End print_native_lifecycle_ets]

  private upsertPrinter(printer: PrinterInfoModel): void {
    const nextPrinters: PrinterInfoModel[] = [];
    let replaced: boolean = false;
    for (const current of this.discoveredPrinters) {
      if (current.printerId === printer.printerId) {
        nextPrinters.push(printer);
        replaced = true;
      } else {
        nextPrinters.push(current);
      }
    }
    if (!replaced) {
      nextPrinters.push(printer);
    }
    this.discoveredPrinters = nextPrinters;
  }

  private removePrinter(printerId: string): void {
    const nextPrinters: PrinterInfoModel[] = [];
    for (const printer of this.discoveredPrinters) {
      if (printer.printerId !== printerId) {
        nextPrinters.push(printer);
      }
    }
    this.discoveredPrinters = nextPrinters;
    if (this.selectedPrinter.printerId === printerId) {
      this.selectedPrinter = PrinterInfoModel.EMPTY;
      this.pageSizes = [PageSizeModel.A4];
      this.selectedPageSize = PageSizeModel.A4;
    }
  }

  private handlePrinterChange(event: number, printer: PrinterInfoModel): void {
    if (event === 1) {
      this.removePrinter(printer.printerId);
      return;
    }
    this.upsertPrinter(printer);
    if (this.selectedPrinter.printerId === printer.printerId) {
      this.selectPrinter(printer);
    }
  }

  // [Start print_native_discovery_ets]
  private startDiscovery(): void {
    const code: number = nativePrint.nativeStartPrinterDiscovery(
      (event: number, printerInfo: nativePrint.PrinterInfo): void => {
        this.handleDiscoveryEvent(event, PrinterInfoModel.fromNative(printerInfo));
      });
    this.setCodeResult('OH_Print_StartPrinterDiscovery', code);
  }

  private handleDiscoveryEvent(event: number, printer: PrinterInfoModel): void {
    if (event === DiscoveryEvent.LOST) {
      this.removePrinter(printer.printerId);
      return;
    }
    if (event === DiscoveryEvent.DISCOVERED) {
      this.upsertPrinter(printer);
      return;
    }
    if (event === DiscoveryEvent.CONNECTING) {
      this.operationResult = this.getResourceText($r('app.string.connecting')) + ': ' + printer.printerName;
      return;
    }
    if (event === DiscoveryEvent.CONNECTED) {
      this.upsertPrinter(printer);
      this.selectPrinter(printer);
      this.operationResult = this.getResourceText($r('app.string.connected')) + ': ' + printer.printerName;
    }
  }

  private connectPrinter(printer: PrinterInfoModel): void {
    const code: number = nativePrint.nativeConnectPrinter(printer.printerId);
    this.setCodeResult('OH_Print_ConnectPrinter', code);
  }
  // [End print_native_discovery_ets]

  private refreshDiscovery(): void {
    nativePrint.nativeStopPrinterDiscovery();
    this.discoveredPrinters = [];
    this.startDiscovery();
  }

  private selectPrinter(printer: PrinterInfoModel): void {
    const keepPageSize: boolean = this.selectedPrinter.printerId === printer.printerId;
    const selectedPageSizeId: string = this.selectedPageSize.id;
    this.selectedPrinter = printer;
    if (printer.pageSizes.length === 0) {
      this.pageSizes = [PageSizeModel.A4];
      this.selectedPageSize = PageSizeModel.A4;
    } else {
      this.pageSizes = printer.pageSizes;
      this.selectedPageSize = printer.pageSizes[0];
      if (keepPageSize) {
        for (const pageSize of this.pageSizes) {
          if (pageSize.id === selectedPageSizeId) {
            this.selectedPageSize = pageSize;
            break;
          }
        }
      }
    }
  }

  private openPrinterDialog(): void {
    this.printerDialogController.open();
  }

  private parseMargin(value: string): number {
    const margin: number = Number(value);
    if (!Number.isFinite(margin) || margin < 0) {
      return 0;
    }
    return Math.floor(margin);
  }

  // [Start print_native_request_ets]
  private createPrintRequest(fd: number): PrintRequest {
    const margin: MarginModel = new MarginModel(this.parseMargin(this.leftMargin),
      this.parseMargin(this.topMargin), this.parseMargin(this.rightMargin), this.parseMargin(this.bottomMargin));
    const printJob: PrintJobModel = new PrintJobModel(fd, this.selectedPrinter.printerId, this.copyNumber,
      this.colorMode, this.duplexMode, this.orientationMode);
    const option: PrintOptionModel = new PrintOptionModel(this.selectedDocumentFormat, this.printQuality,
      this.borderless, this.mediaType);
    return new PrintRequest(printJob, this.selectedPageSize, margin, option);
  }
  // [End print_native_request_ets]

  private getContext(): Context | undefined {
    return this.getUIContext().getHostContext();
  }

  // [Start print_native_preview_ets]
  private async startSystemPreviewPrint(): Promise<void> {
    if (this.selectedDocumentFormat !== 'application/pdf') {
      this.operationResult = this.getResourceText($r('app.string.preview_pdf_only'));
      return;
    }
    const context: Context | undefined = this.getContext();
    if (context === undefined) {
      this.setCodeResult('OH_Print_StartPrintByNative', 401);
      return;
    }
    let file: fileIo.File | undefined = undefined;
    try {
      file = await PrintFileUtils.openSample(context, this.selectedFileName);
      if (file === undefined) {
        this.operationResult = this.getResourceText($r('app.string.open_file_failed'));
        return;
      }
      const code: number = nativePrint.nativeStartPrintByNative('NativePrintFile', file.fd, context,
        (event: nativePrint.NativePrintEvent): void => {
          if (event.eventType === NativePrintEventType.WRITE_RESULT) {
            this.operationResult = 'OH_Print_StartPrintByNative writeCode=' + event.writeCode.toString();
          } else {
            this.operationResult = 'OH_Print_StartPrintByNative state=' + event.state.toString();
          }
        });
      this.setCodeResult('OH_Print_StartPrintByNative', code);
    } catch {
      this.operationResult = this.getResourceText($r('app.string.open_file_failed'));
    } finally {
      PrintFileUtils.close(file);
    }
  }
  // [End print_native_preview_ets]

  // [Start print_native_start_job_ets]
  private async startDirectPrint(): Promise<void> {
    if (this.selectedPrinter.printerId.length === 0) {
      this.setCodeResult('OH_Print_StartPrintJob', INVALID_PRINTER_ERROR);
      return;
    }
    const context: Context | undefined = this.getContext();
    if (context === undefined) {
      this.setCodeResult('OH_Print_StartPrintJob', 401);
      return;
    }
    let file: fileIo.File | undefined = undefined;
    try {
      file = await PrintFileUtils.openSample(context, this.selectedFileName);
      if (file === undefined) {
        this.operationResult = this.getResourceText($r('app.string.open_file_failed'));
        return;
      }
      const request: PrintRequest = this.createPrintRequest(file.fd);
      const code: number = nativePrint.nativeStartPrintJob(request.printJob, request.pageSize, request.margin,
        request.option);
      this.setCodeResult('OH_Print_StartPrintJob', code);
    } catch {
      this.operationResult = this.getResourceText($r('app.string.open_file_failed'));
    } finally {
      PrintFileUtils.close(file);
    }
  }
  // [End print_native_start_job_ets]

  // [Start print_native_job_state_ets]
  private async startPrintWithStateCallback(): Promise<void> {
    if (this.selectedPrinter.printerId.length === 0) {
      this.setCodeResult('OH_Print_StartPrintWithJobStateCallback', INVALID_PRINTER_ERROR);
      return;
    }
    const context: Context | undefined = this.getContext();
    if (context === undefined) {
      this.setCodeResult('OH_Print_StartPrintWithJobStateCallback', 401);
      return;
    }
    let file: fileIo.File | undefined = undefined;
    try {
      file = await PrintFileUtils.openSample(context, this.selectedFileName);
      if (file === undefined) {
        this.operationResult = this.getResourceText($r('app.string.open_file_failed'));
        return;
      }
      const request: PrintRequest = this.createPrintRequest(file.fd);
      const code: number = nativePrint.nativeStartPrintWithJobStateCallback(request.printJob, request.pageSize,
        request.margin, request.option, (event: nativePrint.PrintJobStateEvent): void => {
          this.operationResult = 'OH_Print_StartPrintWithJobStateCallback jobId=' + event.jobId + ', state=' +
            event.state.toString();
        });
      this.setCodeResult('OH_Print_StartPrintWithJobStateCallback', code);
    } catch {
      this.operationResult = this.getResourceText($r('app.string.open_file_failed'));
    } finally {
      PrintFileUtils.close(file);
    }
  }
  // [End print_native_job_state_ets]

  private queryPrinterList(): void {
    const result: nativePrint.PrinterIdListResult = nativePrint.nativeQueryPrinterList();
    this.operationResult = 'OH_Print_QueryPrinterList code=' + result.code.toString() + ', ids=' +
      result.printerIds.join(',');
  }

  private queryPrinterInfo(): void {
    if (this.selectedPrinter.printerId.length === 0) {
      this.setCodeResult('OH_Print_QueryPrinterInfo', INVALID_PRINTER_ERROR);
      return;
    }
    const result: nativePrint.PrinterInfoResult =
      nativePrint.nativeQueryPrinterInfo(this.selectedPrinter.printerId);
    if (result.code === 0 && result.printerInfo !== undefined) {
      this.selectPrinter(PrinterInfoModel.fromNative(result.printerInfo));
    }
    this.setCodeResult('OH_Print_QueryPrinterInfo', result.code);
  }

  private queryPrinterProperties(): void {
    if (this.selectedPrinter.printerId.length === 0) {
      this.setCodeResult('OH_Print_QueryPrinterProperties', INVALID_PRINTER_ERROR);
      return;
    }
    const result: nativePrint.PrinterPropertiesResult =
      nativePrint.nativeQueryPrinterProperties(this.selectedPrinter.printerId, [this.propertyKey]);
    if (result.code === 0 && result.properties.length > 0) {
      this.propertyValue = result.properties[0].value;
    }
    this.setCodeResult('OH_Print_QueryPrinterProperties', result.code);
  }

  private updatePrinterProperties(): void {
    if (this.selectedPrinter.printerId.length === 0) {
      this.setCodeResult('OH_Print_UpdatePrinterProperties', INVALID_PRINTER_ERROR);
      return;
    }
    const property: PrintPropertyModel = new PrintPropertyModel(this.propertyKey, this.propertyValue);
    const code: number = nativePrint.nativeUpdatePrinterProperties(this.selectedPrinter.printerId, [property]);
    this.setCodeResult('OH_Print_UpdatePrinterProperties', code);
  }

  private restorePrinterProperties(): void {
    if (this.selectedPrinter.printerId.length === 0) {
      this.setCodeResult('OH_Print_RestorePrinterProperties', INVALID_PRINTER_ERROR);
      return;
    }
    const code: number = nativePrint.nativeRestorePrinterProperties(this.selectedPrinter.printerId,
      [this.propertyKey]);
    this.setCodeResult('OH_Print_RestorePrinterProperties', code);
  }

  private initService(): void {
    this.setCodeResult('OH_Print_Init', nativePrint.nativeInit());
  }

  private releaseService(): void {
    this.setCodeResult('OH_Print_Release', nativePrint.nativeRelease());
  }

  private registerListener(): void {
    const code: number = nativePrint.nativeRegisterPrinterChangeListener(
      (event: number, printerInfo: nativePrint.PrinterInfo): void => {
        this.handlePrinterChange(event, PrinterInfoModel.fromNative(printerInfo));
      });
    this.setCodeResult('OH_Print_RegisterPrinterChangeListener', code);
  }

  private unregisterListener(): void {
    this.setCodeResult('OH_Print_UnregisterPrinterChangeListener',
      nativePrint.nativeUnregisterPrinterChangeListener());
  }

  @Builder
  SectionTitle(title: Resource) {
    Text(title)
      .fontSize(20)
      .fontWeight(FontWeight.Bold)
      .width('100%')
      .margin({ top: 8 })
  }

  @Builder
  ApiButton(label: Resource, componentId: string, action: () => void) {
    Button(label)
      .id(componentId)
      .height(40)
      .margin({ right: 8, bottom: 8 })
      .onClick(() => {
        action();
      })
  }

  build() {
    Scroll() {
      Column({ space: 12 }) {
        Text($r('app.string.page_title'))
          .fontSize(28)
          .fontWeight(FontWeight.Bold)
          .width('100%')

        this.SectionTitle($r('app.string.print_file'))
        Row({ space: 12 }) {
          Button($r('app.string.jpeg_file'))
            .id('file_jpeg')
            .layoutWeight(1)
            .onClick(() => {
              this.selectedFileName = 'printSample.jpg';
              this.selectedDocumentFormat = 'image/jpeg';
            })
          Button($r('app.string.pdf_file'))
            .id('file_pdf')
            .layoutWeight(1)
            .onClick(() => {
              this.selectedFileName = 'printDemo.pdf';
              this.selectedDocumentFormat = 'application/pdf';
            })
        }
        .width('100%')
        Text(this.selectedFileName)
          .id('file_status')
          .fontColor($r('app.color.text_secondary'))
          .width('100%')

        this.SectionTitle($r('app.string.printer'))
        Button() {
          Row() {
            Text(this.selectedPrinter.printerId.length === 0 ? $r('app.string.not_selected') :
              this.selectedPrinter.printerName)
              .layoutWeight(1)
              .textAlign(TextAlign.Start)
            Text($r('app.string.choose'))
              .fontColor($r('app.color.brand'))
          }
          .width('100%')
        }
        .id('printer_select')
        .width('100%')
        .backgroundColor($r('app.color.card_background'))
        .onClick(() => {
          this.openPrinterDialog();
        })

        Row({ space: 8 }) {
          Button($r('app.string.add_printer'))
            .id('add_printer')
            .layoutWeight(1)
            .onClick(() => {
              this.openPrinterDialog();
            })
          Button($r('app.string.refresh'))
            .id('refresh_printer')
            .layoutWeight(1)
            .onClick(() => {
              this.refreshDiscovery();
            })
        }
        .width('100%')

        this.SectionTitle($r('app.string.page_size'))
        Scroll() {
          Row({ space: 8 }) {
            ForEach(this.pageSizes, (pageSize: PageSizeModel) => {
              Button(pageSize.name)
                .id('page_size_' + pageSize.id)
                .backgroundColor(this.selectedPageSize.id === pageSize.id ? $r('app.color.brand') :
                  $r('app.color.card_background'))
                .fontColor(this.selectedPageSize.id === pageSize.id ? '#FFFFFF' : $r('app.color.text_primary'))
                .onClick(() => {
                  this.selectedPageSize = pageSize;
                })
            }, (pageSize: PageSizeModel) => pageSize.id)
          }
        }
        .scrollable(ScrollDirection.Horizontal)
        .width('100%')

        this.SectionTitle($r('app.string.print_settings'))
        Text($r('app.string.print_settings_scope'))
          .fontColor($r('app.color.text_secondary'))
          .width('100%')
        PrintSettings({
          copyNumber: $copyNumber,
          borderless: $borderless,
          leftMargin: $leftMargin,
          topMargin: $topMargin,
          rightMargin: $rightMargin,
          bottomMargin: $bottomMargin,
          colorMode: $colorMode,
          duplexMode: $duplexMode,
          orientationMode: $orientationMode,
          printQuality: $printQuality,
          mediaType: $mediaType
        })

        this.SectionTitle($r('app.string.print_action'))
        Button($r('app.string.system_preview_print'))
          .id('print_preview')
          .width('100%')
          .onClick(() => {
            this.startSystemPreviewPrint();
          })
        Button($r('app.string.direct_print'))
          .id('print_direct')
          .width('100%')
          .onClick(() => {
            this.startDirectPrint();
          })
        Button($r('app.string.callback_print'))
          .id('print_callback')
          .width('100%')
          .onClick(() => {
            this.startPrintWithStateCallback();
          })

        this.SectionTitle($r('app.string.property_workbench'))
        TextInput({ text: this.propertyKey, placeholder: $r('app.string.property_key') })
          .id('property_key')
          .onChange((value: string) => {
            this.propertyKey = value;
          })
        TextInput({ text: this.propertyValue, placeholder: $r('app.string.property_value') })
          .id('property_value')
          .onChange((value: string) => {
            this.propertyValue = value;
          })
        Flex({ wrap: FlexWrap.Wrap }) {
          this.ApiButton($r('app.string.query_property'), 'query_property', () => {
            this.queryPrinterProperties();
          })
          this.ApiButton($r('app.string.update_property'), 'update_property', () => {
            this.updatePrinterProperties();
          })
          this.ApiButton($r('app.string.restore_property'), 'restore_property', () => {
            this.restorePrinterProperties();
          })
        }
        .width('100%')

        this.SectionTitle($r('app.string.api_workbench'))
        Flex({ wrap: FlexWrap.Wrap }) {
          this.ApiButton($r('app.string.initialize_service'), 'native_init', () => {
            this.initService();
          })
          this.ApiButton($r('app.string.release_service'), 'native_release', () => {
            this.releaseService();
          })
          this.ApiButton($r('app.string.register_listener'), 'register_listener', () => {
            this.registerListener();
          })
          this.ApiButton($r('app.string.unregister_listener'), 'unregister_listener', () => {
            this.unregisterListener();
          })
          this.ApiButton($r('app.string.start_discovery'), 'start_discovery', () => {
            this.startDiscovery();
          })
          this.ApiButton($r('app.string.stop_discovery'), 'stop_discovery', () => {
            this.setCodeResult('OH_Print_StopPrinterDiscovery', nativePrint.nativeStopPrinterDiscovery());
          })
          this.ApiButton($r('app.string.query_printer_list'), 'query_printer_list', () => {
            this.queryPrinterList();
          })
          this.ApiButton($r('app.string.query_printer_info'), 'query_printer_info', () => {
            this.queryPrinterInfo();
          })
          this.ApiButton($r('app.string.printer_manager'), 'printer_manager', () => {
            this.setCodeResult('OH_Print_LaunchPrinterManager', nativePrint.nativeLaunchPrinterManager());
          })
        }
        .width('100%')

        this.SectionTitle($r('app.string.operation_result'))
        Text(this.operationResult)
          .id('operation_result')
          .width('100%')
          .height(80)
          .padding(12)
          .fontSize(14)
          .backgroundColor($r('app.color.card_background'))
          .borderRadius(12)
      }
      .width('100%')
      .padding({ left: 16, right: 16, top: 20, bottom: 32 })
      .alignItems(HorizontalAlign.Start)
    }
    .id('main_scroll')
    .width('100%')
    .height('100%')
    .backgroundColor($r('app.color.page_background'))
  }
}
