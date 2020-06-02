<form action="validatecom.jsp" method="post">
    <h3>Compose Mail</h3>
    <table width="580" height="318" align="center">
  <tr>
      <td height="30" colspan="2"><input type="text" name="mto" placeholder="To:" required></td>
  </tr>
  <tr>
      <td height="30" colspan="2"><input type="text" name="msubject" placeholder="Subject:" required></td>
  </tr>
  <tr>
      <td height="217" colspan="2"><textarea name="mtexta" rows="13" cols="70" required></textarea></td>
  </tr>
  <tr>
    <td width="467"><input name="but" type="submit" value="Send">    </td>
    <td width="97" align="right"><input name="but" type="submit" value="Save as Draft"></td>
  </tr>
</table>
</form>
