package com.cebedo.pmsys.chat.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cebedo.pmsys.chat.domain.Conversation;
import com.cebedo.pmsys.chat.domain.Message;
import com.cebedo.pmsys.chat.repository.ConversationSetRepo;
import com.cebedo.pmsys.chat.repository.MessageZSetRepo;
import com.cebedo.pmsys.systemuser.model.SystemUser;

@Service
public class MessageServiceImpl implements MessageService {

	private MessageZSetRepo messageZSetRepo;
	private ConversationSetRepo conversationSetRepo;

	public void setConversationSetRepo(ConversationSetRepo conversationSetRepo) {
		this.conversationSetRepo = conversationSetRepo;
	}

	public void setMessageZSetRepo(MessageZSetRepo messageZSetRepo) {
		this.messageZSetRepo = messageZSetRepo;
	}

	@Transactional
	@Override
	public void add(Message obj) {
		this.messageZSetRepo.add(obj);
		Conversation converse = new Conversation();
		List<SystemUser> contributors = new ArrayList<SystemUser>();
		contributors.add(obj.getRecipient());
		contributors.add(obj.getSender());
		converse.setContributors(contributors);
		this.conversationSetRepo.add(converse);
	}

	@Transactional
	@Override
	public Set<Message> rangeByScore(String key, long min, long max) {
		return this.messageZSetRepo.rangeByScore(key, min, max);
	}

	@Transactional
	@Override
	public void removeRangeByScore(String key, long min, long max) {
		this.messageZSetRepo.removeRangeByScore(key, min, max);
	}

}
