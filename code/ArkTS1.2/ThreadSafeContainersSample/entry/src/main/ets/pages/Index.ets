import {
  memo,
  __memo_context_type,
  __memo_id_type
} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import {
  Text,
  TextAttribute,
  Column,
  Component,
  Button,
  ButtonAttribute,
  ClickEvent,
  UserView
} from '@ohos.arkui.component' // TextAttribute should be insert by ui-plugins
import {
  State,
  StateDecoratedVariable,
  MutableState,
  stateOf,
  observableProxy
} from '@ohos.arkui.stateManagement' // should be insert by ui-plugins
import hilog from '@ohos.hilog'
import { ArrayBlockingQueueTest } from './containers/ArrayBlockingQueueTest';
import { ConcurrentHashMapTest } from './containers/ConcurrentHashMapTest';
import { ConcurrentSetTest } from './containers/ConcurrentSetTest';
import { LinkedBlockingQueueTest } from './containers/LinkedBlockingQueueTest';


@Component
struct MyStateSample {
  aboutToAppear() {
    let arrayQueue = new ArrayBlockingQueueTest();
    arrayQueue.basicScene();
    arrayQueue.concurrentInQueue();
    arrayQueue.concurrentOutQueue();
    arrayQueue.nullBlocking();
    let map = new ConcurrentHashMapTest();
    map.basicScene();
    map.concurrentInQueue();
    map.concurrentOutQueue();
    map.hashMapBenchmark();
    let set = new ConcurrentSetTest();
    set.basicScene();
    set.concurrentInSet();
    set.concurrentOutSet();
    let linkedQueue = new LinkedBlockingQueueTest();
    linkedQueue.basicScene();
    linkedQueue.concurrentInQueue();
    linkedQueue.concurrentOutQueue();
    linkedQueue.fullBlocking();
    linkedQueue.nullBlocking();
  }

  @State stateVar: string = 'state var';
  message: string = 'var';

  build() {
    Column(undefined) {
      Button(this.message).backgroundColor('#FFFF00FF')
        .onClick((e: ClickEvent) => {
          hilog.info(0x0000, 'testTag', 'On Click');
        })
      Text(this.stateVar).fontSize(20)
    }
  }
}

export class ComExampleTrivialApplication extends UserView {
  getBuilder() {
    hilog.info(0x0000, 'testTag', 'getBuilder');
    let wrapper = @
    memo() =>
    {
      hilog.info(0x0000, 'testTag', 'MyStateSample');
      MyStateSample(undefined)
    }
    return wrapper
  }
}