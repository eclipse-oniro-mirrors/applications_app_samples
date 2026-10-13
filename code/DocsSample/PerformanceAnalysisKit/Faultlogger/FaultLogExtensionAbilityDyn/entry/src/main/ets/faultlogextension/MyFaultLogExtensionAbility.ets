// [Start fault_log_extension_arkts_dyn_code_ability]
// 导入需要继承的类FaultLogExtensionAbility
import { FaultLogExtensionAbility, hilog, hiAppEvent } from '@kit.PerformanceAnalysisKit';

export default class MyFaultLogExtensionAbility extends FaultLogExtensionAbility {
  // 重写onConnect函数
  onConnect() {
    hilog.info(0x0000, 'FaultLogExtension', `FaultLogExtensionAbility onConnect`);
  }

  // 重写onDisconnect函数
  onDisconnect() {
    hilog.info(0x0000, 'FaultLogExtension', `FaultLogExtensionAbility onDisconnect`);
  }

  // 重写onFaultReportReady函数
  onFaultReportReady() {
    hilog.info(0x0000, 'FaultLogExtension', `FaultLogExtensionAbility onFaultReportReady`);
    hiAppEvent.addWatcher({
      // 观察者名称，保持与主进程事件观察者B一致
      name: 'EntryAbilityWatcherExtension',
      // 开发者可以订阅感兴趣的系统事件，此处是订阅了应用冻屏事件
      appEventFilters: [
        {
          domain: hiAppEvent.domain.OS,
          names: [hiAppEvent.event.APP_FREEZE]
        }
      ],
      // 开发者可以自行实现订阅回调函数，以便对订阅获取到的事件数据进行自定义处理
      onReceive: (domain: string, appEventGroups: Array<hiAppEvent.AppEventGroup>) => {
        hilog.info(0x0000, 'FaultLogExtension', `HiAppEvent onReceive: domain=${domain}`);
        for (const eventGroup of appEventGroups) {
          // 开发者可以根据事件集合中的事件名称区分不同的系统事件
          hilog.info(0x0000, 'FaultLogExtension', `HiAppEvent eventName=${eventGroup.name}`);
          for (const eventInfo of eventGroup.appEventInfos) {
            // 开发者可以对事件集合中的事件数据进行自定义处理，此处是将事件数据打印在日志中
            hilog.info(0x0000, 'FaultLogExtension', `HiAppEvent eventInfo.domain=${eventInfo.domain}`);
            hilog.info(0x0000, 'FaultLogExtension', `HiAppEvent eventInfo.name=${eventInfo.name}`);
            hilog.info(0x0000, 'FaultLogExtension', `HiAppEvent eventInfo.eventType=${eventInfo.eventType}`);
            // 开发者可以获取到应用冻屏事件发生的时间戳
            hilog.info(0x0000, 'FaultLogExtension', `HiAppEvent eventInfo.params.time=${eventInfo.params['time']}`);
            // 开发者可以获取到应用冻屏事件发生时应用的前后台状态
            hilog.info(0x0000, 'FaultLogExtension', `HiAppEvent eventInfo.params.foreground=${eventInfo.params['foreground']}`);
            // 开发者可以获取到应用冻屏事件发生时应用的版本信息
            hilog.info(0x0000, 'FaultLogExtension', `HiAppEvent eventInfo.params.bundle_version=${eventInfo.params['bundle_version']}`);
            // 开发者可以获取到应用冻屏事件发生时应用的唯一关联id
            hilog.info(0x0000, 'FaultLogExtension', `HiAppEvent eventInfo.params.app_running_unique_id=${eventInfo.params['app_running_unique_id']}`);
            // 开发者可以获取到应用冻屏事件发生时应用的包名
            hilog.info(0x0000, 'FaultLogExtension', `HiAppEvent eventInfo.params.bundle_name=${eventInfo.params['bundle_name']}`);
            // 开发者可以获取到应用冻屏事件发生时应用的进程名称
            hilog.info(0x0000, 'FaultLogExtension', `HiAppEvent eventInfo.params.process_name=${eventInfo.params['process_name']}`);
            // 开发者可以获取到应用冻屏事件发生时应用的进程id
            hilog.info(0x0000, 'FaultLogExtension', `HiAppEvent eventInfo.params.pid=${eventInfo.params['pid']}`);
            hilog.info(0x0000, 'FaultLogExtension', `HiAppEvent eventInfo.params.uid=${eventInfo.params['uid']}`);
            hilog.info(0x0000, 'FaultLogExtension', `HiAppEvent eventInfo.params.uuid=${eventInfo.params['uuid']}`);
            // 开发者可以获取到应用冻屏事件发生的异常类型、异常原因
            hilog.info(0x0000, 'FaultLogExtension', `HiAppEvent eventInfo.params.exception=${JSON.stringify(eventInfo.params['exception'])}`);
            // 开发者可以获取到应用冻屏事件发生时日志信息
            hilog.info(0x0000, 'FaultLogExtension', `HiAppEvent eventInfo.params.hilog.size=${eventInfo.params['hilog'].length}`);
            // 开发者可以获取到应用冻屏事件发生时主线程未处理消息
            hilog.info(0x0000, 'FaultLogExtension', `HiAppEvent eventInfo.params.event_handler=${eventInfo.params['event_handler']}`);
            hilog.info(0x0000, 'FaultLogExtension', `HiAppEvent eventInfo.params.event_handler_size_3s=${eventInfo.params['event_handler_size_3s']}`);
            hilog.info(0x0000, 'FaultLogExtension', `HiAppEvent eventInfo.params.event_handler_size_6s=${eventInfo.params['event_handler_size_6s']}`);
            // 开发者可以获取到应用冻屏事件发生时同步binder调用信息
            hilog.info(0x0000, 'FaultLogExtension', `HiAppEvent eventInfo.params.peer_binder=${eventInfo.params['peer_binder']}`);
            // 开发者可以获取到应用冻屏事件发生时全量线程调用栈
            hilog.info(0x0000, 'FaultLogExtension', `HiAppEvent eventInfo.params.threads.size=${eventInfo.params['threads'].length}`);
            // 开发者可以获取到应用冻屏事件发生时内存信息
            hilog.info(0x0000, 'FaultLogExtension', `HiAppEvent eventInfo.params.memory=${JSON.stringify(eventInfo.params['memory'])}`);
            // 开发者可以获取到应用冻屏事件发生时的故障日志文件
            hilog.info(0x0000, 'FaultLogExtension', `HiAppEvent eventInfo.params.external_log=${JSON.stringify(eventInfo.params['external_log'])}`);
            hilog.info(0x0000, 'FaultLogExtension', `HiAppEvent eventInfo.params.log_over_limit=${eventInfo.params['log_over_limit']}`);
          }
        }
      }
    });
  }
}
// [End fault_log_extension_arkts_dyn_code_ability]