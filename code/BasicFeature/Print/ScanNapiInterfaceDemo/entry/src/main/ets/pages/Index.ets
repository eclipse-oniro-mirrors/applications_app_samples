/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import {Scan} from '../scan/scan';
import {ScanLog} from '../scan/log';
import {scan} from '@kit.BasicServicesKit';
import {image} from '@kit.ImageKit';

@CustomDialog
struct CustomDialogPicture {
  public controller: CustomDialogController
  @Link image : PixelMap;
  build() {
    Column() {
      Text($r('app.string.scan_close_dialog'))
        .id('scanCloseDialogBtn')
        .fontSize(25)
        .margin(({top : 10, bottom : 10}))
        .fontColor(Color.Red)
        .fontWeight(FontWeight.Bold)
        .onClick(()=>{
          this.controller.close();
        })
      Row() {
        if (this.image != undefined) {
          Image(this.image)
            .width('100%')
            .height('100%')
        }
      }
    }
  }
}

@Entry
@Component
struct Index {
  public scannerId : string = '';
  public timerId : number = 0;
  @State fd : number = -1;
  @State image: PixelMap | undefined = undefined;
  public pictureController: CustomDialogController = new CustomDialogController({
    builder : CustomDialogPicture({
      image:$image
    }),
    alignment : DialogAlignment.Default,
  })
  aboutToAppear(): void {
    Scan.init().then(()=>{
      ScanLog.info('init scan successful')
    }).catch(() => {
      ScanLog.warn('init scan error')
    })
  }

  aboutToDisappear(): void {
    Scan.closeScanner(this.scannerId).then(()=>{
    }).catch(()=>{
      ScanLog.warn('scan closeScan error');
    })
    Scan.exit().then(()=>{
      ScanLog.info('exit scan successful')
    }).catch(()=>{
      ScanLog.warn('exit scan error')
    })
  }

  build() {
    Column() {
      Text($r('app.string.scan_title'))
        .id('scanTitle')
        .fontSize(25)
        .fontColor(Color.Black)
        .height(100)
      Row() {
        Column() {
          Button($r('app.string.scan_search_btn'))
            .id('scanSearchBtn')
            .onClick(() => {
              Scan.on('scanDeviceFound', (device: scan.ScannerDevice) => {
                ScanLog.info('scanner info : ' + JSON.stringify(device));
                this.scannerId = device.scannerId;
              })
              Scan.startScannerDiscovery().then(() => {
                ScanLog.info('scan startScannerDiscovery successful');
              }).catch(() => {
                ScanLog.warn('scan startScannerDiscovery error')
              })
            })
            .height(180)
            .width(180)
          Button($r('app.string.scan_start_btn'))
            .id('scanStartBtn')
            .onClick(() => {
              Scan.startScan(this.scannerId, false).then(() => {
                this.timerId = setInterval(() => {
                  Scan.getScanProgress(this.scannerId).then((scanProgress: scan.PictureScanProgress) => {
                    ScanLog.info('scan getProgress' + JSON.stringify(scanProgress))
                    if (scanProgress.progress === 100) {
                      if (scanProgress.isFinal) {
                        clearInterval(this.timerId);
                      }
                      let fd: number = scanProgress.pictureFd;
                      let imageSource: image.ImageSource = image.createImageSource(fd);
                      imageSource.createPixelMap().then((pic) => {
                        this.image = pic;
                      })
                    }
                  }).catch(() => {
                    ScanLog.warn('scan getScanProgress error');
                    clearInterval(this.timerId);
                  })
                }, 500);
              }).catch(() => {
                ScanLog.warn('scan startScan error');
              })
            })
            .height(180)
            .width(180)
          Button($r('app.string.scan_cancel_btn'))
            .id('scanCancelBtn')
            .onClick(() => {
              Scan.cancelScan(this.scannerId).then(() => {
              }).catch(() => {
                ScanLog.warn('scan cancelScan error');
              })
            })
            .height(180)
            .width(180)
        }

        Column() {
          Button($r('app.string.scan_open_btn'))
            .id('scanOpenBtn')
            .onClick(() => {
              Scan.openScanner(this.scannerId).then(() => {
              }).catch(() => {
                ScanLog.warn('scan openScanner error');
              })
            })
            .height(180)
            .width(180)
          Button($r('app.string.scan_get_option_btn'))
            .id('scanGetOptionBtn')
            .onClick(() => {
              Scan.getScannerParameter(this.scannerId).then((parameters: scan.ScannerParameter[]) => {
                ScanLog.info('scan getScannerParameter : ' + JSON.stringify(parameters));
                parameters.forEach((parameter: scan.ScannerParameter) => {
                  Scan.getScannerCurrentSetting(this.scannerId, parameter.optionIndex)
                    .then((value: scan.ScannerOptionValue) => {
                      ScanLog.info('scan getScannerCurrentSetting : ' + JSON.stringify(value));
                    }).catch(() => {
                      ScanLog.warn('scan getScannerCurrentSetting error');
                    })
                })
              }).catch(() => {
                ScanLog.warn('scan getScannerParameter error');
              })
            })
            .height(180)
            .width(180)
          Button($r('app.string.scan_set_option_btn'))
            .id('scanSetOptionBtn')
            .onClick(() => {
              let value : scan.ScannerOptionValue = {
                valueType : scan.OptionValueType.SCAN_TYPE_STRING,
                strValue : 'Automatic Document Feeder',
              };
              Scan.setScannerParameter(this.scannerId, 6, value).then(() => {
              }).catch(() => {
                ScanLog.warn('scan setScannerParameter error');
              })
            })
            .height(180)
            .width(180)
        }
      }
      Button($r('app.string.scan_preview_btn'))
        .id('scanPreviewBtn')
        .fontSize(25)
        .fontColor(Color.Black)
        .height(100)
        .width(350)
        .onClick(()=>{
          this.pictureController.open();
        })
    }
  }
}