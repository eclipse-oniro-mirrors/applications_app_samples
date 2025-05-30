/*
 * Copyright (c) 2023-2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

// [Start local_file_refresh]
// [Start network_file_refresh]
import { Want } from '@kit.AbilityKit';
import { BusinessError } from '@kit.BasicServicesKit';
import { fileIo } from '@kit.CoreFileKit';
import { formBindingData, FormExtensionAbility, formInfo, formProvider } from '@kit.FormKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { http } from '@kit.NetworkKit';

const TAG: string = 'WgtImgUpdateEntryFormAbility';
const DOMAIN_NUMBER: number = 0xFF00;
const TEXT1: string = '刷新中...'
const TEXT2: string = '刷新失败'

export default class WgtImgUpdateEntryFormAbility extends FormExtensionAbility {
  // [StartExclude network_file_refresh]
  // 在添加卡片时，打开一个本地图片并将图片内容传递给卡片页面显示
  onAddForm(want: Want): formBindingData.FormBindingData {
    // 假设在当前卡片应用的tmp目录下有一个本地图片：head.PNG
    let tempDir = this.context.getApplicationContext().tempDir;
    hilog.info(DOMAIN_NUMBER, TAG, `tempDir: ${tempDir}`);
    // 打开本地图片并获取其打开后的fd
    let imgMap: Record<string, number> = {};
    try {
      // 打开本地图片并获取其打开后的fd
      let file = fileIo.openSync(tempDir + '/' + 'head.PNG');
      imgMap['imgBear'] = file.fd;
    } catch (e) {
      hilog.error(DOMAIN_NUMBER, TAG, `openSync failed: ${JSON.stringify(e as BusinessError)}`);
    }
    ;

    class FormDataClass {
      text: string = 'Image: Bear';
      loaded: boolean = true;
      // 卡片需要显示图片场景, 必须和下列字段formImages 中的key 'imgBear' 相同。
      imgName: string = 'imgBear';
      // 卡片需要显示图片场景, 必填字段(formImages 不可缺省或改名), 'imgBear' 对应 fd
      formImages: Record<string, number> = imgMap;
    }

    let formData = new FormDataClass();
    // 将fd封装在formData中并返回至卡片页面
    return formBindingData.createFormBindingData(formData);
  }
  // [StartExclude local_file_refresh]
  // [EndExclude network_file_refresh]
  async onFormEvent(formId: string, message: string): Promise<void> {
    let param: Record<string, string> = {
      'text': TEXT1
    };
    let formInfo: formBindingData.FormBindingData = formBindingData.createFormBindingData(param);
    formProvider.updateForm(formId, formInfo);

    // 注意：FormExtensionAbility在触发生命周期回调时被拉起，仅能在后台存在5秒
    // 建议下载能快速下载完成的小文件，如在5秒内未下载完成，则此次网络图片无法刷新至卡片页面上
    let netFile =
      'https://cn-assets.gitee.com/assets/mini_app-e5eee5a21c552b69ae6bf2cf87406b59.jpg';
    // 需要在此处使用真实的网络图片下载链接
    let tempDir = this.context.getApplicationContext().tempDir;
    let fileName = 'file' + Date.now();
    let tmpFile = tempDir + '/' + fileName;
    let imgMap: Record<string, number> = {};

    class FormDataClass {
      text: string = 'Image: Bear' + fileName;
      loaded: boolean = true;
      // 卡片需要显示图片场景, 必须和下列字段formImages 中的key fileName 相同。
      imgName: string = fileName;
      // 卡片需要显示图片场景, 必填字段(formImages 不可缺省或改名), fileName 对应 fd
      formImages: Record<string, number> = imgMap;
    }

    let httpRequest = http.createHttp()
    let data = await httpRequest.request(netFile);
    if (data?.responseCode == http.ResponseCode.OK) {
      try {
        let imgFile = fileIo.openSync(tmpFile, fileIo.OpenMode.READ_WRITE | fileIo.OpenMode.CREATE);
        imgMap[fileName] = imgFile.fd;
        try {
          let writeLen: number = await fileIo.write(imgFile.fd, data.result as ArrayBuffer);
          hilog.info(DOMAIN_NUMBER, TAG, "write data to file succeed and size is:" + writeLen);
          hilog.info(DOMAIN_NUMBER, TAG, 'ArkTSCard download complete: %{public}s', tmpFile);
          try {
            let formData = new FormDataClass();
            let formInfo = formBindingData.createFormBindingData(formData);
            await formProvider.updateForm(formId, formInfo);
            hilog.info(DOMAIN_NUMBER, TAG, '%{public}s', 'FormAbility updateForm success.');
          } catch (error) {
            hilog.error(DOMAIN_NUMBER, TAG, `FormAbility updateForm failed: ${JSON.stringify(error)}`);
          }
        } catch (err) {
          hilog.error(DOMAIN_NUMBER, TAG,
            "write data to file failed with error message: " + err.message + ", error code: " + err.code);
        } finally {
          fileIo.closeSync(imgFile);
        }
        ;
      } catch (e) {
        hilog.error(DOMAIN_NUMBER, TAG, `openSync failed: ${JSON.stringify(e as BusinessError)}`);
      }

    } else {
      hilog.error(DOMAIN_NUMBER, TAG, `ArkTSCard download task failed`);
      let param: Record<string, string> = {
        'text': TEXT2
      };
      let formInfo: formBindingData.FormBindingData = formBindingData.createFormBindingData(param);
      formProvider.updateForm(formId, formInfo);
    }
    httpRequest.destroy();
  }
  // [StartExclude network_file_refresh]

  onAcquireFormState(want: Want): formInfo.FormState {
    // Called to return a {@link FormState} object.
    return formInfo.FormState.READY;
  }
  // [EndExclude local_file_refresh]
  // [EndExclude network_file_refresh]
}
// [End local_file_refresh]

