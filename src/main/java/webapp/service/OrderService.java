package webapp.service;

import webapp.common.Result;

public interface OrderService {

    Result add(String uId, String pId, String pay);
}
