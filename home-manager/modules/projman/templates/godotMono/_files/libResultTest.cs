using #{name}.Lib;

namespace Tests;

public class LibResultTest()
{
    [Fact]
    public void TestUnwrapOr()
    {
        Result<string, string> result;

        result = new Result<string, string>.Ok("ok");

        Assert.Equal("ok", result.UnwrapOr("err"));

        result = new Result<string, string>.Err("ok");

        Assert.Equal("err", result.UnwrapOr("err"));
    }

    [Fact]
    public void TestUnwrapOrDefault()
    {
        Result<string, string> result;

        result = new Result<string, string>.Ok("ok");

        Assert.Equal("ok", result.UnwrapOrDefault());

        result = new Result<string, string>.Err("ok");

        Assert.Null(result.UnwrapOrDefault());
    }

    [Fact]
    public void TestMatch()
    {
        Result<string, string> result;

        result = new Result<string, string>.Ok("ok");

        result.Match
        (
            ok: value =>
            {
                Assert.Equal("ok", value);
            },
            err: error =>
            {
                Assert.Fail();
            }
        );

        result = new Result<string, string>.Err("err");

        result.Match
        (
            ok: value =>
            {
                Assert.Fail();
            },
            err: error =>
            {
                Assert.Equal("err", error);
            }
        );
    }
}
