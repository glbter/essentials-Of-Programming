### 1 В чому полягає різниця між параметрами та атрибутами?
- client ==> (request) ---> (parameters) ==> server
- parameters are always `String` type
```java
  protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    response.setContentType("text/html;charset=UTF-8");
    try (PrintWriter out = response.getWriter()) {
      String aParam = request.getParameter("a"); // param is always a String
      String bParam = request.getParameter("b");
      int a = Integer.parseInt(aParam); // Parse it if you want something other
      int b = Integer.parseInt(bParam);
      int result = a+b;
    }
  }
    ```
- getParameter() returns http request parameters. Those passed from the client to the server. For example http://example.com/servlet?parameter=1. Can only return String
- getAttribute() is for server-side usage only - you fill the request with attributes that you can use within the same request. For example - you set an attribute in a servlet, and read it from a JSP. Can be used for any object, not just string.
[stack overflow](https://stackoverflow.com/questions/5243754/difference-between-getattribute-and-getparameter)
