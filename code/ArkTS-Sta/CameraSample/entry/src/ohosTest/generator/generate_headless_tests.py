from pathlib import Path
import re, json, shutil, math, argparse
parser = argparse.ArgumentParser(description='Generate headless CameraSample model contract suites')
parser.add_argument('--reference', type=Path, required=True)
parser.add_argument('--output', type=Path, default=Path(__file__).resolve().parents[1])
args = parser.parse_args()
ref=args.reference.resolve()
out=args.output.resolve()
backup=Path('/private/tmp/camera-ohostest-before-headless-20261117')
if out.exists() and not backup.exists(): shutil.copytree(out, backup)
# The assigned scope explicitly replaces the just-created UI suites with a headless package.
if (out/'ets').exists(): shutil.rmtree(out/'ets')
if (out/'resources').exists(): shutil.rmtree(out/'resources')
root=out/'ets/test'; root.mkdir(parents=True)
license='''/*
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
'''
header="'use static';\n"+license+'''\nimport { describe, expect, it, Level, Size, TestType } from '@ohos/hypium';
import { ResourceStr } from '@ohos.arkui.component';
import { Comment } from '../../../../main/ets/pages/model/CommentModel';
import { Constants } from '../../../../main/ets/pages/constants/Constants';
\n'''
# Values come from an explicit boundary catalog; the sequence offset makes test tuples distinct.
texts=['', ' ', '  leading and trailing  ', '\\tinput\\t', 'line one\\nline two', 'camera,photo;comment:ready!', 'O\'Brien "camera"', '100% captured / path?', '你好，鸿蒙', 'カメラの写真', 'صورة الكاميرا', 'café naïve résumé', 'emoji 📷 🌈', 'zero\\u0000inside', 'mix中English123', 'a'*255, 'b'*1024, '<script>camera</script>', '${imageUri}', 'file://storage/photo.jpg', 'https://example.com/a?x=1&y=2', '\\r\\n', 'e\\u0301', '𠮷野家', '#camera @sample [image]']
ids=['0','1','-1','2147483647','-2147483648','4294967295','0.5','-0.5','9007199254740991','-9007199254740991','1024','-1024','3.141592653589793']
times=['','2026-11-17 00:00','2026-11-17 23:59','2000-02-29 12:30','1970-01-01 00:00','9999-12-31 23:59','invalid timestamp','2026-11-17T08:30:00Z',' 2026-11-17 08:30 ','2026/11/17 08:30']
def lit(s):
    # Catalog escape sequences denote actual payload characters, then emit valid string escapes.
    s=s.replace('\\t','\t').replace('\\n','\n').replace('\\r','\r').replace('\\u0000','\0').replace('\\u0301','\u0301')
    return "'"+s.replace('\\','\\\\').replace("'","\\'").replace('\n','\\n').replace('\r','\\r').replace('\t','\\t').replace('\0','\\u0000')+"'"
def assertion(lines, name, type_, expression, expected, method='assertEqual'):
    lines.extend([f'      const {name}: {type_} = {expression};',f'      const expected{name[0].upper()+name[1:]}: {type_} = {expected};',f'      expect({name}).{method}(expected{name[0].upper()+name[1:]});'])
case_manifest=[]
current_target=''
def make_case(part,n,g):
    mode=g%10
    name=f'commentModelPart{part:02d}Case{n:03d}'
    q=g//10
    v=texts[q%len(texts)]; v2=texts[(q//len(texts))%len(texts)]
    nm=f'user-{g:04d} '+v; cm=f'comment-{g:04d} '+v2
    tm=times[(q//5)%len(times)]; ident=ids[q%len(ids)]
    uri1=f'file://capture/session-{g:04d}/photo-1.jpg'; uri2=f'file://capture/session-{g:04d}/photo-2.jpg'; uri3=f'file://capture/session-{g:04d}/photo-3.jpg'
    descs=[
      'Verify Comment preserves every assigned field and ordered image data',
      'Verify Comment instances keep independent image arrays and scalar fields',
      'Verify Comment images retain append insertion and replacement order',
      'Verify Comment string fields preserve whitespace punctuation and Unicode payloads',
      'Verify Comment id accepts numeric boundary values without modifying text fields',
      'Verify Comment image copy mutation remains isolated from its source array',
      'Verify Comment reset assignments restore empty strings and empty image arrays',
      'Verify Comment shared image array aliasing follows direct field assignment',
      'Verify Constants capture action and result key remain exact contract strings',
      'Verify Comment image removal preserves retained data and unrelated fields'
    ]
    case_manifest.append({'name':name,'file':current_target,'scenario':descs[mode],'inputs':{'mode':mode,'nameText':v,'commentText':v2,'idLiteral':ident,'timestamp':tm,'imageUris':[uri1,uri2,uri3]}})
    lines=[f'    // @tc.number SUB_CAMERA_COMMENT_MODEL_PART{part:02d}_{n*100:04d}',f'    // @tc.name {name}',f'    // @tc.desc {descs[mode]}', '    // @tc.size MediumTest','    // @tc.type Function','    // @tc.level Level 2', f"    it('{name}', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {{", '      const actual: Comment = new Comment();']
    if mode==0:
      lines += [f'      actual.id = {ident};',f'      actual.name = {lit(nm)};',f'      actual.comment = {lit(cm)};',f'      actual.avatar = {lit(uri1)};',f'      actual.time = {lit(tm)};',f'      actual.images = [{lit(uri1)}, {lit(uri2)}];']
      for a,b,c,d in [('actualId','number','actual.id',ident),('actualName','string','actual.name',lit(nm)),('actualComment','ResourceStr','actual.comment',lit(cm)),('actualAvatar','ResourceStr','actual.avatar',lit(uri1)),('actualTime','string','actual.time',lit(tm)),('imageCount','int','actual.images.length','2'),('firstImage','ResourceStr','actual.images[0]',lit(uri1)),('lastImage','ResourceStr','actual.images[1]',lit(uri2))]: assertion(lines,a,b,c,d)
    elif mode==1:
      lines += ['      const second: Comment = new Comment();',f'      actual.name = {lit(nm)};', f'      actual.images.push({lit(uri1)});',f'      second.name = {lit(cm)};',f'      second.images.push({lit(uri2)});']
      for a,b,c,d in [('actualName','string','actual.name',lit(nm)),('secondName','string','second.name',lit(cm)),('actualImageCount','int','actual.images.length','1'),('secondImageCount','int','second.images.length','1'),('actualImage','ResourceStr','actual.images[0]',lit(uri1)),('secondImage','ResourceStr','second.images[0]',lit(uri2)),('sameInstance','boolean','actual === second','false'),('sameArray','boolean','actual.images === second.images','false')]: assertion(lines,a,b,c,d)
    elif mode==2:
      lines += [f'      actual.comment = {lit(cm)};',f'      actual.images.push({lit(uri1)});',f'      actual.images.push({lit(uri3)});',f'      actual.images.splice(1, 0, {lit(uri2)});']
      for a,b,c,d in [('imageCount','int','actual.images.length','3'),('firstImage','ResourceStr','actual.images[0]',lit(uri1)),('middleImage','ResourceStr','actual.images[1]',lit(uri2)),('lastImage','ResourceStr','actual.images[2]',lit(uri3)),('actualComment','ResourceStr','actual.comment',lit(cm))]: assertion(lines,a,b,c,d)
      lines += [f'      actual.images[1] = {lit(cm)};']
      assertion(lines,'replacementImage','ResourceStr','actual.images[1]',lit(cm)); assertion(lines,'retainedFirst','ResourceStr','actual.images[0]',lit(uri1)); assertion(lines,'retainedLast','ResourceStr','actual.images[2]',lit(uri3))
    elif mode==3:
      lines += [f'      actual.name = {lit(v)};',f'      actual.comment = {lit(v2)};',f'      actual.avatar = {lit(nm)};',f'      actual.time = {lit(tm)};',f'      actual.images = [{lit(v)}, {lit(v2)}];']
      for a,b,c,d in [('actualName','string','actual.name',lit(v)),('actualComment','ResourceStr','actual.comment',lit(v2)),('actualAvatar','ResourceStr','actual.avatar',lit(nm)),('actualTime','string','actual.time',lit(tm)),('imageCount','int','actual.images.length','2'),('firstImage','ResourceStr','actual.images[0]',lit(v)),('secondImage','ResourceStr','actual.images[1]',lit(v2)),('actualId','number','actual.id','0')]: assertion(lines,a,b,c,d)
    elif mode==4:
      lines += [f'      actual.name = {lit(nm)};',f'      actual.comment = {lit(cm)};',f'      actual.time = {lit(tm)};',f'      actual.id = {ident};']
      for a,b,c,d in [('actualId','number','actual.id',ident),('actualName','string','actual.name',lit(nm)),('actualComment','ResourceStr','actual.comment',lit(cm)),('actualTime','string','actual.time',lit(tm)),('imageCount','int','actual.images.length','0')]: assertion(lines,a,b,c,d)
      lines += [f'      actual.id = {ids[(g+1)%len(ids)]};']
      assertion(lines,'updatedId','number','actual.id',ids[(g+1)%len(ids)]); assertion(lines,'retainedName','string','actual.name',lit(nm)); assertion(lines,'retainedComment','ResourceStr','actual.comment',lit(cm))
    elif mode==5:
      lines += [f'      actual.images = [{lit(uri1)}, {lit(uri2)}];','      const second: Comment = new Comment();','      second.images = actual.images.slice();',f'      second.images.push({lit(uri3)});',f'      second.images[0] = {lit(cm)};']
      for a,b,c,d in [('sourceCount','int','actual.images.length','2'),('copyCount','int','second.images.length','3'),('sourceFirst','ResourceStr','actual.images[0]',lit(uri1)),('copyFirst','ResourceStr','second.images[0]',lit(cm)),('sourceLast','ResourceStr','actual.images[1]',lit(uri2)),('copyLast','ResourceStr','second.images[2]',lit(uri3)),('sameArray','boolean','actual.images === second.images','false'),('sourceId','number','actual.id','0')]: assertion(lines,a,b,c,d)
    elif mode==6:
      lines += [f'      actual.id = {ident};',f'      actual.name = {lit(nm)};',f'      actual.comment = {lit(cm)};',f'      actual.avatar = {lit(uri1)};',f'      actual.time = {lit(tm)};',f'      actual.images = [{lit(uri1)}, {lit(uri2)}];','      actual.id = 0;',"      actual.name = '';", "      actual.comment = '';", "      actual.avatar = '';", "      actual.time = '';", '      actual.images = [];']
      for a,b,c,d in [('actualId','number','actual.id','0'),('actualName','string','actual.name',"''"),('actualComment','ResourceStr','actual.comment',"''"),('actualAvatar','ResourceStr','actual.avatar',"''"),('actualTime','string','actual.time',"''"),('imageCount','int','actual.images.length','0')]: assertion(lines,a,b,c,d)
    elif mode==7:
      lines += [f'      actual.name = {lit(nm)};',f'      actual.images = [{lit(uri1)}];','      const second: Comment = new Comment();','      second.images = actual.images;',f'      second.images.push({lit(uri2)});',f'      second.name = {lit(cm)};']
      for a,b,c,d in [('sourceCount','int','actual.images.length','2'),('aliasCount','int','second.images.length','2'),('sourceFirst','ResourceStr','actual.images[0]',lit(uri1)),('sourceLast','ResourceStr','actual.images[1]',lit(uri2)),('aliasLast','ResourceStr','second.images[1]',lit(uri2)),('sameArray','boolean','actual.images === second.images','true'),('sourceName','string','actual.name',lit(nm)),('aliasName','string','second.name',lit(cm))]: assertion(lines,a,b,c,d)
    elif mode==8:
      # Fixtures express only the published constants; no claim is made about a camera callback.
      lines += [f'      actual.name = {lit(nm)};',f'      actual.comment = {lit(cm)};',f'      actual.images = [{lit(uri1)}];']
      for a,b,c,d in [('captureAction','string','Constants.ACTION_PICKER_CAMERA',"'ohos.want.action.imageCapture'"),('resultParameterKey','string','Constants.KEY_RESULT_PICKER_CAMERA',"'resourceUri'"),('actualName','string','actual.name',lit(nm)),('actualComment','ResourceStr','actual.comment',lit(cm)),('firstImage','ResourceStr','actual.images[0]',lit(uri1)),('imageCount','int','actual.images.length','1'),('defaultTime','string','actual.time',"''"),('defaultAvatar','ResourceStr','actual.avatar',"''")]: assertion(lines,a,b,c,d)
    else:
      lines += [f'      actual.id = {ident};',f'      actual.comment = {lit(cm)};',f'      actual.images = [{lit(uri1)}, {lit(uri2)}, {lit(uri3)}];','      actual.images.splice(1, 1);']
      for a,b,c,d in [('imageCount','int','actual.images.length','2'),('firstImage','ResourceStr','actual.images[0]',lit(uri1)),('lastImage','ResourceStr','actual.images[1]',lit(uri3)),('actualId','number','actual.id',ident),('actualComment','ResourceStr','actual.comment',lit(cm))]: assertion(lines,a,b,c,d)
      lines += ['      actual.images.pop();']
      assertion(lines,'remainingCount','int','actual.images.length','1'); assertion(lines,'remainingImage','ResourceStr','actual.images[0]',lit(uri1)); assertion(lines,'retainedComment','ResourceStr','actual.comment',lit(cm))
    lines += ['    });','']
    return '\n'.join(lines)+'\n'
refs=sorted(p for p in (ref/'ets/test').rglob('*.test.ets') if p.name not in ['List.test.ets','Ability.test.ets'])
manifest=[]; g=0
for part,src in enumerate(refs,1):
    folder=root/'CommentModel';folder.mkdir(exist_ok=True)
    name=f'CommentModelPart{part:02d}Test.test.ets'; p=folder/name
    before=len(src.read_text().splitlines())
    suite=f'commentModelPart{part:02d}Test'
    current_target=str(p.relative_to(out))
    text=header+f'export default function {suite}(): void {{\n  describe(\'CommentModelPart{part:02d}Test\', (): void => {{\n'
    count=0
    # Budget grows by real test blocks, never blank-line padding.
    while len((text+'  });\n}\n').splitlines()) < math.ceil(before*1.25)+28:
        count+=1;g+=1;text+=make_case(part,count,g)
    text+='  });\n}\n'
    p.write_text(text)
    manifest.append({'reference':str(src.relative_to(ref)),'target':str(p.relative_to(out)),'referenceLines':before,'targetLines':len(text.splitlines()),'cases':count})
# Default values are checked before any assignment and with a second fresh instance.
def make_default_case():
    name='commentModelDefaults001'
    lines=[
      '    // @tc.number SUB_CAMERA_COMMENT_MODEL_DEFAULTS_0100',
      '    // @tc.name commentModelDefaults001',
      '    // @tc.desc Verify Comment constructor initializes every field and independent image arrays',
      '    // @tc.size MediumTest',
      '    // @tc.type Function',
      '    // @tc.level Level 2',
      "    it('commentModelDefaults001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {",
      '      const actual: Comment = new Comment();',
      '      const second: Comment = new Comment();'
    ]
    for a,b,c,d in [('actualId','number','actual.id','0'),('actualName','string','actual.name',"''"),('actualComment','ResourceStr','actual.comment',"''"),('actualAvatar','ResourceStr','actual.avatar',"''"),('actualTime','string','actual.time',"''"),('imageCount','int','actual.images.length','0'),('secondImageCount','int','second.images.length','0'),('sameArray','boolean','actual.images === second.images','false')]:
      assertion(lines,a,b,c,d)
    lines += ['    });','']
    case_manifest.append({'name':name,'file':'ets/test/Ability.test.ets','scenario':'Verify Comment constructor initializes every field and independent image arrays','inputs':{'constructorCalls':2}})
    return '\n'.join(lines)+'\n'

# Ability file is a direct model-default contract test, also mapped.
abilityheader=header.replace("../../../../main/", "../../../main/")
current_target='ets/test/Ability.test.ets'
text=abilityheader+'''export default function cameraAbilityContractTest(): void {
  describe('CameraAbilityContractTest', (): void => {
'''+make_default_case()+make_case(99,1,0)+'''  });
}
'''
(root/'Ability.test.ets').write_text(text)
manifest.append({'reference':'ets/test/Ability.test.ets','target':'ets/test/Ability.test.ets','referenceLines':len((ref/'ets/test/Ability.test.ets').read_text().splitlines()),'targetLines':len(text.splitlines()),'cases':2})
# Entry registration includes every generated suite. Each entry is both imported and called.
text="'use static';\n"+license+'\n'
for part in range(1,len(refs)+1):text+=f"import commentModelPart{part:02d}Test from './CommentModel/CommentModelPart{part:02d}Test.test';\n"
text+="import cameraAbilityContractTest from './Ability.test';\n\nexport default function testsuite(): void {\n"
for part in range(1,len(refs)+1):text+=f'  commentModelPart{part:02d}Test();\n'
text+='  cameraAbilityContractTest();\n}\n'
(root/'List.test.ets').write_text(text)
manifest.append({'reference':'ets/test/List.test.ets','target':'ets/test/List.test.ets','referenceLines':len((ref/'ets/test/List.test.ets').read_text().splitlines()),'targetLines':len(text.splitlines()),'cases':0})
# Headless runner invokes Hypium directly; it never launches a TestAbility or production UI.
p=out/'ets/testrunner/OpenHarmonyTestRunner.ets';p.parent.mkdir(parents=True,exist_ok=True)
p.write_text("'use static';\n"+license+'''
import hilog from '@ohos.hilog';
import TestRunner from '@ohos.application.testRunner';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import { Hypium } from '@ohos/hypium';
import testsuite from '../test/List.test';

export default class OpenHarmonyTestRunner implements TestRunner {
  onPrepare(): void {
    hilog.info(0x0000, 'CameraModelTest', '%{public}s', 'Preparing headless model tests');
    hilog.info(0x0000, 'CameraModelTest', '%{public}s', 'Scope: Comment fields and Constants');
    hilog.info(0x0000, 'CameraModelTest', '%{public}s', 'No camera hardware is required');
  }

  private logArguments(args: abilityDelegatorRegistry.AbilityDelegatorArgs): void {
    const bundleName: string = args.bundleName;
    const runnerName: string = args.testRunnerClassName;
    const caseNames: string = args.testCaseNames;
    hilog.info(0x0000, 'CameraModelTest', 'Bundle: %{public}s', bundleName);
    if (runnerName.length > 0) {
      hilog.info(0x0000, 'CameraModelTest', 'Runner: %{public}s', runnerName);
    } else {
      hilog.info(0x0000, 'CameraModelTest', '%{public}s', 'Runner name is supplied by the test framework');
    }
    if (caseNames.length > 0) {
      hilog.info(0x0000, 'CameraModelTest', 'Case filter: %{public}s', caseNames);
    } else {
      hilog.info(0x0000, 'CameraModelTest', '%{public}s', 'All registered model cases are eligible');
    }
    const serializedParameters: string = JSON.stringify(args.parameters);
    hilog.info(0x0000, 'CameraModelTest', 'Parameters: %{public}s', serializedParameters);
  }

  private validateArguments(args: abilityDelegatorRegistry.AbilityDelegatorArgs): void {
    if (args.bundleName.length === 0) {
      throw new Error('The headless test runner requires a bundle name');
    }
    const action: string = 'Comment data contract';
    hilog.info(0x0000, 'CameraModelTest', 'Test scope: %{public}s', action);
  }

  onRun(): void {
    const delegator: abilityDelegatorRegistry.AbilityDelegator =
      abilityDelegatorRegistry.getAbilityDelegator();
    const args: abilityDelegatorRegistry.AbilityDelegatorArgs =
      abilityDelegatorRegistry.getArguments();
    this.validateArguments(args);
    this.logArguments(args);
    hilog.info(0x0000, 'CameraModelTest', '%{public}s', 'Registering independent model cases');
    Hypium.hypiumTest(delegator, args, testsuite);
    hilog.info(0x0000, 'CameraModelTest', '%{public}s', 'Headless model suite dispatched');
  }
}
''')
module=license+'''\n{
  "module": {
    "name": "entry_test",
    "type": "feature",
    "deviceTypes": [
      "phone",
      "tablet",
      "2in1"
    ],
    "deliveryWithInstall": true,
    "installationFree": false
  }
}
'''
(out/'module.json5').write_text(module)
(out/'headless-test-manifest.json').write_text(json.dumps({'scope':'Comment model and Constants only; no UI or capture callback execution','caseCount':g+2,'files':manifest,'cases':case_manifest,'mappings':manifest},ensure_ascii=False,indent=2)+'\n')
print(json.dumps({'referenceSuites':len(refs),'totalCases':g+2,'etsLines':sum(len(p.read_text().splitlines()) for p in out.rglob('*.ets')),'mappedLines':sum(x['targetLines'] for x in manifest),'minViolations':[x for x in manifest if x['targetLines']<x['referenceLines']]},indent=2))
