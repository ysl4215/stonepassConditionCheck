//package com.swempire.web.comm.util;
//
//import java.time.LocalDateTime;
//import java.util.List;
//
//import javax.annotation.PostConstruct;
//import javax.annotation.PreDestroy;
//import javax.inject.Inject;
//
//import org.springframework.scheduling.Trigger;
//import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;
//import org.springframework.scheduling.support.CronTrigger;
//import org.springframework.stereotype.Component;
//
//import com.swempire.web.condition.VO.ConditionVO;
//import com.swempire.web.condition.VO.EmailVO;
//import com.swempire.web.condition.service.ConditionService;
//import com.swempire.web.condition.service.EmailService;
//
//@Component
//public class Scheduler {
//
//	@Inject
//	ConditionService conditionservice;
//
//	@Inject
//	private EmailService emailservice;
//
//	Curl curl = new Curl();
//	EmailVO emailvo = new EmailVO();
//	SendMailUtil smu = new SendMailUtil();
//
//	int stop;
//
//	public int getStop() {
//		return stop;
//	}
//
//	public void setStop(int stop) {
//		this.stop = stop;
//	}
//
//	private ThreadPoolTaskScheduler scheduler;
//	private String cron = "*/5 * * * * *";
//
//	public void startScheduler() {
//		scheduler = new ThreadPoolTaskScheduler();
//		scheduler.initialize();
//		// scheduler setting
//		scheduler.schedule(getRunnable(), getTrigger());
//
//	}
//
//	public void changeCronSet(String cron) {
//		this.cron = cron;
//	}
//
//	public void stopScheduler() {
//		scheduler.shutdown();
//	}
//
//	private Runnable getRunnable() {
//
//		// do something
//		return () -> {
//			System.out.println(LocalDateTime.now().toString());
//			try {
//				List<ConditionVO> orgaList = conditionservice.getBoardList();
//
//				// System.out.println(conditionservice.getBoardList());
//				List<EmailVO> emailList = emailservice.emailListSelect();
//
//				for (int i = 0; i < orgaList.size(); i++) {
//
//					String url = conditionservice.getBoardList().get(i).getOrga_url();
//					curl.get(url, null);
//
//					int curlCode = curl.getCurlCode();
//					int errorNum = curl.getErrorNum();
//
//					if (curlCode == 200 && errorNum != 0) {
//						System.out.println("???????????? ??????");
//						this.stop = 10;
//					} else if (curlCode != 200 || errorNum == 0) {
//
//						emailvo.setBid(orgaList.get(i).getBid());
//						emailservice.emailErrorOrganameSelect(emailvo);
//
//						String[] errorOrgaName = { emailservice.emailErrorOrganameSelect(emailvo).getOrga_name() };
//
//						// ??????????????? ??????????????? Recipient set
//						for (int j = 0; j < emailList.size(); j++) {
//							smu.setRecipient(emailList.get(j).getEmail());
//
//							// ???????????? ????????? ??????????????? title??? ??????(SendMailUtil???????????? title??? ??????)
//							for (int k = 0; k < errorOrgaName.length; k++) {
//
//								smu.setTitle(errorOrgaName[k]);
//								// email?????????
//								smu.send();
//
//							}
//
//						}
//
//						this.stop = 0;
//					}
//				}
//				
//
//			} catch (Exception e) {
//				// TODO Auto-generated catch block
//				e.printStackTrace();
//			}
//
//		};
//	}
//
//	private Trigger getTrigger() {
//		// cronSetting
//		return new CronTrigger(cron);
//	}
//
//	@PostConstruct
//	public void init() {
//		startScheduler();
//	}
//
//	@PreDestroy
//	public void destroy() {
//		stopScheduler();
//	}
//}
